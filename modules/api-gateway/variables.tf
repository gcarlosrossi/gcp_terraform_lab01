variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region for API Gateway"
  type        = string
  default     = "us-central1"
}

variable "environment" {
  description = "Environment (dev, prod)"
  type        = string
}

variable "function_urls" {
  description = "Map of Cloud Function URLs"
  type = object({
    create = string
    read   = string
    update = string
    delete = string
  })
}

variable "labels" {
  description = "Labels to apply to all resources"
  type        = map(string)
  default     = {}
}
