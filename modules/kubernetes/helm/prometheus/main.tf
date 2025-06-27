resource "helm_release" "prometheus" {
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "prometheus"
  namespace        = var.namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/values.yaml.tmpl", {
      namespace            = var.namespace
      load_balancer_scheme = var.load_balancer_scheme
      allowed_cidrs        = join(",", var.allowed_cidrs)
      storageClassName = var.storageClassName
    })
  ]
}
