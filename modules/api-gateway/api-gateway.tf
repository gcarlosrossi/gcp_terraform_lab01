# API config
resource "google_api_gateway_api" "api" {
  provider = google-beta
  project  = var.project_id
  api_id   = "${var.environment}-crud-api"
  labels   = var.labels
}

# Enable the managed service for this API Gateway
resource "google_project_service" "api_gateway_managed_service" {
  provider = google-beta
  project  = var.project_id
  service  = google_api_gateway_api.api.managed_service

  disable_on_destroy = false

  depends_on = [google_api_gateway_api.api]
}

# API config with OpenAPI spec
resource "google_api_gateway_api_config" "api_config" {
  provider      = google-beta
  project       = var.project_id
  api           = google_api_gateway_api.api.api_id
  api_config_id = "${var.environment}-crud-config-v2"

  openapi_documents {
    document {
      path = "openapi.yaml"
      contents = base64encode(templatefile("${path.module}/openapi.yaml", {
        create_url = var.function_urls.create
        read_url   = var.function_urls.read
        update_url = var.function_urls.update
        delete_url = var.function_urls.delete
      }))
    }
  }

  labels = var.labels

  lifecycle {
    create_before_destroy = true
  }
}

# API gateway
resource "google_api_gateway_gateway" "gateway" {
  provider   = google-beta
  project    = var.project_id
  region     = var.region
  api_config = google_api_gateway_api_config.api_config.id
  gateway_id = "${var.environment}-crud-gateway"
  labels     = var.labels

  depends_on = [google_project_service.api_gateway_managed_service]
}
