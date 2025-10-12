project_id  = "architecture-academy"
environment = "dev"
region      = "us-east1"

# Labels
labels = {
  managed-by = "terraform"
  project    = "serverless-lab01"
}

# Cloud Functions
runtime = "python311"
memory  = "256Mi"
timeout = 60

environment_variables = {
  LOG_LEVEL = "INFO"
}

# Firestore
firestore_location                          = "nam5"
firestore_type                              = "FIRESTORE_NATIVE"
firestore_concurrency_mode                  = "OPTIMISTIC"
firestore_app_engine_integration_mode       = "DISABLED"
firestore_point_in_time_recovery_enablement = "POINT_IN_TIME_RECOVERY_ENABLED"
firestore_delete_protection_state           = "DELETE_PROTECTION_ENABLED"
firestore_deletion_policy                   = "DELETE"