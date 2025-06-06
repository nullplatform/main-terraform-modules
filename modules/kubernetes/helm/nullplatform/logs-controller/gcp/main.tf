module "nullplatform" {
  source = "../.."

  values_yaml = templatefile("${path.module}/template/values.yaml", {
    registry = var.registry,
    password = var.service_account_key_base64
  })
}
