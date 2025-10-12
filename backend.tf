terraform {
  backend "gcs" {
    bucket = "architecture-academy-dev-state-bucket"
    prefix = "terraform/state"
  }
}
