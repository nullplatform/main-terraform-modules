locals {
  prometheus-values = templatefile("${path.module}/templates/prometheus-values.tmpl.yaml", {
  })
}