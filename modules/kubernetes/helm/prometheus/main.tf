resource "helm_release" "prometheus" {
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "prometheus"
  namespace        = var.namespace
  create_namespace = true

  set {
    name  = "server.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-source-ranges"
    value = join(",", var.allowed_cidrs)
  }

  values = [
    file("${path.module}/values.yaml")
  ]
}
