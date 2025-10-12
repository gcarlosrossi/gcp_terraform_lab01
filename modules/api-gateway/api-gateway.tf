# API config
resource "google_api_gateway_api" "api" {
  provider = google-beta
  project  = var.project_id
  api_id   = "${var.environment}-crud-api"
}

# API config with OpenAPI spec
resource "google_api_gateway_api_config" "api_config" {
  provider      = google-beta
  project       = var.project_id
  api           = google_api_gateway_api.api.api_id
  api_config_id = "${var.environment}-crud-config"

  openapi_documents {
    document {
      path     = "openapi.yaml"
      contents = base64encode(templatefile("${path.module}/openapi.yaml", {
        create_url = var.function_urls.create
        read_url   = var.function_urls.read
        update_url = var.function_urls.update
        delete_url = var.function_urls.delete
      }))
    }
  }

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
}
