variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "name" {
  description = "Firestore database name"
  type        = string
}

variable "location_id" {
  description = "Firestore database location"
  type        = string
}

variable "labels" {
  description = "Labels for the database"
  type        = map(string)
  default     = {}
}

variable "type" {
  description = "Database type (NATIVE or DATASTORE_MODE)"
  type        = string
  default     = "NATIVE"
}

variable "concurrency_mode" {
  description = "Concurrency mode (OPTIMISTIC or PESSIMISTIC)"
  type        = string
  default     = "OPTIMISTIC"
}

variable "app_engine_integration_mode" {
  description = "App Engine integration mode (ENABLED or DISABLED)"
  type        = string
  default     = "DISABLED"
}

variable "point_in_time_recovery_enablement" {
  description = "Enable point in time recovery"
  type        = string
  default     = "POINT_IN_TIME_RECOVERY_ENABLED"
}

variable "delete_protection_state" {
  description = "Delete protection state"
  type        = string
  default     = "DELETE_PROTECTION_ENABLED"
}

variable "deletion_policy" {
  description = "Deletion policy (KEEP or DELETE)"
  type        = string
  default     = "DELETE"
}