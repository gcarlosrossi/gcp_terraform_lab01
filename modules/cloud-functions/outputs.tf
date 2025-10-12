# Service account outputs
output "service_accounts" {
  description = "Map of service account emails"
  value = {
    create = module.function_service_accounts.emails_list[0]
    read   = module.function_service_accounts.emails_list[1]
    update = module.function_service_accounts.emails_list[2]
    delete = module.function_service_accounts.emails_list[3]
  }
}

# Function URL outputs
output "function_urls" {
  description = "Map of function URLs"
  value = {
    create = module.create_function.function_uri
    read   = module.read_function.function_uri
    update = module.update_function.function_uri
    delete = module.delete_function.function_uri
  }
}

# Bucket output
output "functions_bucket_name" {
  description = "Name of functions source bucket"
  value       = google_storage_bucket.functions_bucket.name
}
