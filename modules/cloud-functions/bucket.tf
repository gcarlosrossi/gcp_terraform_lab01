# Storage bucket for function source code
resource "google_storage_bucket" "functions_bucket" {
  name          = "${var.project_id}-${var.environment}-functions"
  project       = var.project_id
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true

  labels = var.labels
}