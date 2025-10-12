output "gateway_url" {
  description = "URL of the API Gateway"
  value       = google_api_gateway_gateway.gateway.default_hostname
}

output "api_id" {
  description = "API ID"
  value       = google_api_gateway_api.api.api_id
}

output "gateway_id" {
  description = "Gateway ID"
  value       = google_api_gateway_gateway.gateway.gateway_id
}

output "api_key" {
  description = "API Key for authentication (sensitive)"
  value       = google_apikeys_key.api_key.key_string
  sensitive   = true
}

output "api_key_name" {
  description = "API Key resource name"
  value       = google_apikeys_key.api_key.name
}
