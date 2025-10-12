#######################
# Firestore Outputs ###
#######################
output "firestore_database_id" {
  description = "The ID of the Firestore database"
  value       = module.firestore.database_id
}

output "firestore_database_location" {
  description = "The location of the Firestore database"
  value       = module.firestore.database_location
}

#######################
# Cloud Functions #####
#######################
output "function_urls" {
  description = "URLs for the Cloud Functions"
  value       = module.cloud_functions.function_urls
}

output "function_service_accounts" {
  description = "Service accounts used by Cloud Functions"
  value       = module.cloud_functions.service_accounts
}

output "functions_bucket_name" {
  description = "Name of the GCS bucket storing function source code"
  value       = module.cloud_functions.functions_bucket_name
}

#######################
# API Gateway #########
#######################
output "api_gateway_url" {
  description = "URL of the API Gateway"
  value       = module.api_gateway.gateway_url
}

output "api_id" {
  description = "ID of the API Gateway API"
  value       = module.api_gateway.api_id
}

output "gateway_id" {
  description = "ID of the API Gateway"
  value       = module.api_gateway.gateway_id
}

#######################
# API Authentication ##
#######################
output "api_key" {
  description = "API Key for authentication (use with header 'x-api-key')"
  value       = module.api_gateway.api_key
  sensitive   = true
}

output "api_key_name" {
  description = "API Key resource name"
  value       = module.api_gateway.api_key_name
}
