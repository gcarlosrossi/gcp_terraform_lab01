# IAM permissions for functions
resource "google_project_iam_member" "create_datastore_user" {
  project = var.project_id
  role    = "roles/datastore.user"
  member  = "serviceAccount:${module.function_service_accounts.emails_list[0]}"
}

resource "google_project_iam_member" "read_datastore_viewer" {
  project = var.project_id
  role    = "roles/datastore.viewer"
  member  = "serviceAccount:${module.function_service_accounts.emails_list[1]}"
}

resource "google_project_iam_member" "update_datastore_user" {
  project = var.project_id
  role    = "roles/datastore.user"
  member  = "serviceAccount:${module.function_service_accounts.emails_list[2]}"
}

resource "google_project_iam_member" "delete_datastore_user" {
  project = var.project_id
  role    = "roles/datastore.user"
  member  = "serviceAccount:${module.function_service_accounts.emails_list[3]}"
}