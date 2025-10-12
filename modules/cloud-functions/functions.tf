# Create function
module "create_function" {
  source  = "GoogleCloudPlatform/cloud-functions/google"
  version = "~> 0.6"

  function_name = "${var.environment}-create"
  project_id    = var.project_id
  location      = var.region
  runtime       = var.runtime
  entrypoint    = "main"

  storage_source = {
    bucket = google_storage_bucket.functions_bucket.name
    object = var.source_archive_object
  }

  service_config = {
    max_instance_count    = 10
    available_memory      = var.memory
    timeout_seconds       = var.timeout
    service_account_email = module.function_service_accounts.emails_list[0]
    environment_variables = merge(
      var.environment_variables,
      {
        FIRESTORE_DATABASE = var.firestore_database_id
      }
    )
  }
}

# Read function
module "read_function" {
  source  = "GoogleCloudPlatform/cloud-functions/google"
  version = "~> 0.6"

  function_name = "${var.environment}-read"
  project_id    = var.project_id
  location      = var.region
  runtime       = var.runtime
  entrypoint    = "main"

  storage_source = {
    bucket = google_storage_bucket.functions_bucket.name
    object = var.source_archive_object
  }

  service_config = {
    max_instance_count    = 10
    available_memory      = var.memory
    timeout_seconds       = var.timeout
    service_account_email = module.function_service_accounts.emails_list[1]
    environment_variables = merge(
      var.environment_variables,
      {
        FIRESTORE_DATABASE = var.firestore_database_id
      }
    )
  }
}

# Update function
module "update_function" {
  source  = "GoogleCloudPlatform/cloud-functions/google"
  version = "~> 0.6"

  function_name = "${var.environment}-update"
  project_id    = var.project_id
  location      = var.region
  runtime       = var.runtime
  entrypoint    = "main"

  storage_source = {
    bucket = google_storage_bucket.functions_bucket.name
    object = var.source_archive_object
  }

  service_config = {
    max_instance_count    = 10
    available_memory      = var.memory
    timeout_seconds       = var.timeout
    service_account_email = module.function_service_accounts.emails_list[2]
    environment_variables = merge(
      var.environment_variables,
      {
        FIRESTORE_DATABASE = var.firestore_database_id
      }
    )
  }
}

# Delete function
module "delete_function" {
  source  = "GoogleCloudPlatform/cloud-functions/google"
  version = "~> 0.6"

  function_name = "${var.environment}-delete"
  project_id    = var.project_id
  location      = var.region
  runtime       = var.runtime
  entrypoint    = "main"

  storage_source = {
    bucket = google_storage_bucket.functions_bucket.name
    object = var.source_archive_object
  }

  service_config = {
    max_instance_count    = 10
    available_memory      = var.memory
    timeout_seconds       = var.timeout
    service_account_email = module.function_service_accounts.emails_list[3]
    environment_variables = merge(
      var.environment_variables,
      {
        FIRESTORE_DATABASE = var.firestore_database_id
      }
    )
  }
}
