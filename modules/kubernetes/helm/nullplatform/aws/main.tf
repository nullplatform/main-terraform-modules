module "nullplatform" {
  source = "./.."

  values_yaml = templatefile("${path.module}/template/values.yaml", {
    region             = data.aws_region.current.name,
    tls_secret_name    = var.tls_secret_name
    cloudwatch_enabled = var.cloudwatch_enabled
  })
}

