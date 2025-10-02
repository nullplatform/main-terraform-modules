resource "kubernetes_namespace" "nullplatform_namespaces" {
  for_each = toset(var.namespaces)

  metadata {
    name = each.key
  }
}
