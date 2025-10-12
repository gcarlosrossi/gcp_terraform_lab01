locals {
  common_labels = merge(
    var.labels,
    {
      environment = var.environment
    }
  )
}

#######################
# Firestore Database ##
#######################
module "firestore" {
  source = "./modules/firestore"

  project_id                        = var.project_id
  name                              = "${var.environment}-firestore-db"
  location_id                       = var.firestore_location
  type                              = var.firestore_type
  concurrency_mode                  = var.firestore_concurrency_mode
  app_engine_integration_mode       = var.firestore_app_engine_integration_mode
  point_in_time_recovery_enablement = var.firestore_point_in_time_recovery_enablement
  delete_protection_state           = var.firestore_delete_protection_state
  deletion_policy                   = var.firestore_deletion_policy

  depends_on = [google_project_service.project_services]
}

#######################
# Cloud Functions #####
#######################
module "cloud_functions" {
  source = "./modules/cloud-functions"

  project_id            = var.project_id
  region                = var.region
  environment           = var.environment
  runtime               = var.runtime
  memory                = var.memory
  timeout               = var.timeout
  environment_variables = var.environment_variables
  firestore_database_id = module.firestore.database_id
  labels                = local.common_labels

  depends_on = [module.firestore, google_project_service.project_services]
}

#######################
# API Gateway #########
#######################
module "api_gateway" {
  source = "./modules/api-gateway"

  project_id  = var.project_id
  region      = var.region
  environment = var.environment

  function_urls = {
    create = module.cloud_functions.function_urls["create"]
    read   = module.cloud_functions.function_urls["read"]
    update = module.cloud_functions.function_urls["update"]
    delete = module.cloud_functions.function_urls["delete"]
  }

  labels = local.common_labels

  depends_on = [module.cloud_functions, google_project_service.project_services]
}
