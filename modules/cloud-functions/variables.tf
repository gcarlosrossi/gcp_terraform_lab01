variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region for Cloud Functions"
  type        = string
  default     = "us-central1"
}

variable "environment" {
  description = "Environment (dev, prod)"
  type        = string
}

variable "runtime" {
  description = "Function runtime"
  type        = string
  default     = "python311"
}

variable "memory" {
  description = "Memory allocated to function"
  type        = string
  default     = "256Mi"
}

variable "timeout" {
  description = "Function timeout in seconds"
  type        = number
  default     = 60

  validation {
    condition     = var.timeout >= 1 && var.timeout <= 540
    error_message = "Timeout must be between 1 and 540 seconds"
  }
}

variable "environment_variables" {
  description = "Environment variables for functions"
  type        = map(string)
  default     = {}
}

variable "source_archive_object" {
  description = "Name of the source archive in GCS bucket"
  type        = string
}

variable "firestore_database_id" {
  description = "Firestore database ID"
  type        = string
}
