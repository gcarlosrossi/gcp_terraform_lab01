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
