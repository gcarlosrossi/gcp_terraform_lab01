variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, prod)"
  type        = string
  default     = "dev"
}

variable "labels" {
  description = "Common labels for all resources"
  type        = map(string)
}
