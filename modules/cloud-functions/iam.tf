# IAM permissions for functions
module "function_iam" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 8.0"

  projects = [var.project_id]
  mode     = "additive"

  bindings = {
    "roles/datastore.user" = [
      "serviceAccount:${module.function_service_accounts.emails_list[0]}",  # create
      "serviceAccount:${module.function_service_accounts.emails_list[2]}",  # update
      "serviceAccount:${module.function_service_accounts.emails_list[3]}",  # delete
    ]
    "roles/datastore.viewer" = [
      "serviceAccount:${module.function_service_accounts.emails_list[1]}",  # read
    ]
  }
}
