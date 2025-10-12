locals {
  common_labels = merge(
    var.labels,
    {
      environment = var.environment
    }
  )
}