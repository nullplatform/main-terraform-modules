################################################################################
# Platform Config
################################################################################
module "nullplatform_configuration" {
  source = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/nullplatform/aws/nullplatform_providers?ref=v2"

  domain_name                  = var.domain_name
  environment                  = var.environment
  hosted_private_zone_id       = var.hosted_private_zone_id
  hosted_public_zone_id        = var.hosted_public_zone_id
  nrn                          = var.nrn
  organization                 = var.github_organization
  organization_installation_id = var.github_organization_installation_id
  certificate_arn              = var.certificate_arn
  np_api_key                   = var.api_key
}

################################################################################
# Users Config
################################################################################
module "nullplatform_user" {
  source             = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/nullplatform/nullplatform_users?ref=v2"
  np_api_key         = var.api_key
  nullplatform_users = var.nullplatform_users
}

################################################################################
# Acount Config
################################################################################
module "nullplatform_account" {
  source                = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/nullplatform/nullplatform_account?ref=v2"
  np_api_key            = var.api_key
  nullplatform_accounts = var.nullplatform_accounts
}


################################################################################
# Nullplatform Agent Helm Chart Configuration
################################################################################

module "nullplatform_agent" {
  source                              = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/nullplatform/aws/nullplatform_agent?ref=v2"
  cluster_name                        = var.eks_cluster_name
  tags                                = var.tags
  nrn                                 = var.nrn
  agent_repos_extra                   = var.agent_repos_extra
  environment_tag                     = var.environment_tags
  np_api_key                          = var.api_key
  aws_iam_openid_connect_provider_arn = data.aws_iam_openid_connect_provider.this.arn
}

################################################################################
# Nullplatform Base Helm Chart Configuration
################################################################################

module "nullplatform_base_chart" {
  source = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/nullplatform/nullplatform_base?ref=v2"
  nrn    = var.nrn
}

################################################################################
# Prometheus Configuration
################################################################################

module "nullplatform_prometheus" {
  source       = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/workload/prometheus?ref=v2"
  cluster_name = var.eks_cluster_name
  nrn          = var.nrn
}