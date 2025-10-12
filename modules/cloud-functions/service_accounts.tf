# Service accounts for CRUD functions
module "function_service_accounts" {
  source  = "terraform-google-modules/service-accounts/google"
  version = "~> 4.0"

  project_id = var.project_id
  prefix     = var.environment
  names      = ["create-fn", "read-fn", "update-fn", "delete-fn"]

  display_name = "Function Service Accounts"
  description  = "Service accounts for CRUD operations"
}
