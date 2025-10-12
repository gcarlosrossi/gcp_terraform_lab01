# Create function
module "create_function" {
  source  = "GoogleCloudPlatform/cloud-functions/google"
  version = "~> 0.6"

  function_name = "${var.environment}-create"
  project_id    = var.project_id
  function_location      = var.region
  runtime       = var.runtime
  entrypoint    = "main"

  storage_source = {
    bucket = google_storage_bucket.functions_bucket.name
    object = google_storage_bucket_object.create_function.name
  }

  service_config = {
    max_instance_count       = 10
    available_memory         = var.memory
    timeout_seconds          = var.timeout
    service_account_email    = module.function_service_accounts.emails_list[0]
    runtime_env_variables = merge(
      var.environment_variables,
      {
        FIRESTORE_DATABASE = var.firestore_database_id
      }
    )
  }

  labels = var.labels
}

# Read function
module "read_function" {
  source  = "GoogleCloudPlatform/cloud-functions/google"
  version = "~> 0.6"

  function_name = "${var.environment}-read"
  project_id    = var.project_id
  function_location      = var.region
  runtime       = var.runtime
  entrypoint    = "main"

  storage_source = {
    bucket = google_storage_bucket.functions_bucket.name
    object = google_storage_bucket_object.read_function.name
  }

  service_config = {
    max_instance_count       = 10
    available_memory         = var.memory
    timeout_seconds          = var.timeout
    service_account_email    = module.function_service_accounts.emails_list[1]
    runtime_env_variables = merge(
      var.environment_variables,
      {
        FIRESTORE_DATABASE = var.firestore_database_id
      }
    )
  }

  labels = var.labels
}

# Update function
module "update_function" {
  source  = "GoogleCloudPlatform/cloud-functions/google"
  version = "~> 0.6"

  function_name = "${var.environment}-update"
  project_id    = var.project_id
  function_location      = var.region
  runtime       = var.runtime
  entrypoint    = "main"

  storage_source = {
    bucket = google_storage_bucket.functions_bucket.name
    object = google_storage_bucket_object.update_function.name
  }

  service_config = {
    max_instance_count       = 10
    available_memory         = var.memory
    timeout_seconds          = var.timeout
    service_account_email    = module.function_service_accounts.emails_list[2]
    runtime_env_variables = merge(
      var.environment_variables,
      {
        FIRESTORE_DATABASE = var.firestore_database_id
      }
    )
  }

  labels = var.labels
}

# Delete function
module "delete_function" {
  source  = "GoogleCloudPlatform/cloud-functions/google"
  version = "~> 0.6"

  function_name = "${var.environment}-delete"
  project_id    = var.project_id
  function_location      = var.region
  runtime       = var.runtime
  entrypoint    = "main"

  storage_source = {
    bucket = google_storage_bucket.functions_bucket.name
    object = google_storage_bucket_object.delete_function.name
  }

  service_config = {
    max_instance_count       = 10
    available_memory         = var.memory
    timeout_seconds          = var.timeout
    service_account_email    = module.function_service_accounts.emails_list[3]
    runtime_env_variables = merge(
      var.environment_variables,
      {
        FIRESTORE_DATABASE = var.firestore_database_id
      }
    )
  }

  labels = var.labels
}
