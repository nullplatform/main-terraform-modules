module "istio" {
  source = "./istio"
  count  = var.enable_istio ? 1 : 0
}

module "cert-manager" {
  source = "./cert-manager"
  count  = var.enable_cert_manager ? 1 : 0

  depends_on = [module.nullplatform]

  values_yaml = var.values_yaml_cert_manager
  domain_name = var.domain_name
}

module "nullplatform" {
  source = "./nullplatform"

  values_yaml = var.values_yaml_nullplatform
}
