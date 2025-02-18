resource "nullplatform_provider_config" "gke" {
  nrn  = var.nrn
  type = "gke-configuration"
  dimensions = {
    environment = var.environment
  }
  attributes = jsonencode({
    "cluster" : {
      "id" : var.cluster_name,
      "location" : var.location,
      "namespace" : var.namespace
      "image_pull_secrets" : ["image-pull-secret-nullplatform"]
    },
    "gateway" : {
      "namespace" : var.gateway_namespace,
      "public_name" : var.public_gateway_name,
      "private_name" : var.private_gateway_name,
    }
  })
}
