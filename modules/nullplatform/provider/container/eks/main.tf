resource "nullplatform_provider_config" "eks" {
  provider = nullplatform
  nrn      = var.nrn
  type     = "eks-configuration"
  dimensions = {
    environment = var.environment
  }
  attributes = jsonencode({
    cluster = {
      id        = var.cluster_name,
      namespace = var.namespace
    }
  })
}
