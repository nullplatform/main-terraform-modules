resource "nullplatform_provider_config" "eks" {
  provider   = nullplatform
  nrn        = var.nrn
  type       = "eks-configuration"
  dimensions = local.dimensions
  attributes = jsonencode({
    cluster = {
      id        = var.cluster_name,
      namespace = var.namespace
    }
  })
}
