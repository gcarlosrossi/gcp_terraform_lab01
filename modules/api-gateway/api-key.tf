# API Key for basic authentication
resource "google_apikeys_key" "api_key" {
  provider     = google-beta
  project      = var.project_id
  name         = "${var.environment}-crud-api-key"
  display_name = "${var.environment} CRUD API Key"

  restrictions {
    api_targets {
      service = google_api_gateway_api.api.managed_service
    }
  }
}
