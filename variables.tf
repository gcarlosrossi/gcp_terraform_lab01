######################################
# General variables for the project ##
######################################
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

###############################
###### Cloud Functions ########
###############################

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

###############################
###### Firestore ##############
###############################

variable "firestore_location" {
  description = "Location for Firestore database"
  type        = string
  default     = "nam5" # North America
}
variable "firestore_type" {
  description = "Type of Firestore database"
  type        = string
  default     = "FIRESTORE_NATIVE"
}
variable "firestore_concurrency_mode" {
  description = "Concurrency mode for Firestore"
  type        = string
  default     = "OPTIMISTIC"
}
variable "firestore_app_engine_integration_mode" {
  description = "App Engine integration mode for Firestore"
  type        = string
  default     = "DISABLED"
}
variable "firestore_point_in_time_recovery_enablement" {
  description = "Point-in-time recovery enablement for Firestore"
  type        = string
  default     = "POINT_IN_TIME_RECOVERY_ENABLED"
}
variable "firestore_delete_protection_state" {
  description = "Delete protection state for Firestore"
  type        = string
  default     = "DELETE_PROTECTION_ENABLED"
}
variable "firestore_deletion_policy" {
  description = "Deletion policy for Firestore"
  type        = string
  default     = "DELETE"
} 