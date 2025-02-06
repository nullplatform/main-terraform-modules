module "cert-manager" {
  source      = "./.."
  domain_name = var.domain_name
  values_yaml = templatefile("${path.module}/template/values.yaml", {
    domain_name         = var.domain_name,
    project_id          = var.project_id,
    service_account_key = var.service_account_key
  })
}
