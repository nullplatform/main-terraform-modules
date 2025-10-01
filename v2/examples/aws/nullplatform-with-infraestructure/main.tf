###############################################################################
# VPC Config
################################################################################
module "foundations_vpc" {
  source       = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/foundations/aws/vpc?ref=chore/IaC-v2"
  account      = var.account
  organization = var.organization
  vpc          = var.vpc
}

################################################################################
# Route53 Config
################################################################################
module "foundations_route53" {
  source = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/foundations/aws/route53?ref=chore/IaC-v2"

  domain_name = var.domain_name
  vpc_id      = module.foundations_vpc.vpc_id
}

################################################################################
# EKS Config
################################################################################
module "foundations_eks" {
  source = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/foundations/aws/eks?ref=chore/IaC-v2"

  name                    = var.eks_cluster_name
  aws_subnets_private_ids = module.foundations_vpc.private_subnets
  aws_vpc_vpc_id          = module.foundations_vpc.vpc_id
}

################################################################################
# ALB-Controller Config
################################################################################
module "foundations_alb_controller" {
  source = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/foundations/aws/alb-controller?ref=chore/IaC-v2"

  cluster_name = module.foundations_eks.eks_cluster_name
  vpc_id       = module.foundations_vpc.vpc_id

  depends_on                      = [module.foundations_eks]
  aws_iam_openid_connect_provider = module.foundations_eks.eks_oidc_provider_arn
}


################################################################################
# Platform Config
################################################################################
module "nullplatform_configuration" {
  source = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/nullplatform/aws/nullplatform_providers?ref=chore/IaC-v2"

  domain_name                  = var.domain_name
  environment                  = var.environment
  hosted_private_zone_id       = module.foundations_route53.private_zone_id
  hosted_public_zone_id        = module.foundations_route53.public_zone_id
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
  source = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/nullplatform/nullplatform_users?ref=chore/IaC-v2"
  np_api_key = var.api_key
  nullplatform_users = var.nullplatform_users
}

################################################################################
# Acount Config
################################################################################
module "nullplatform_account" {
  source = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/nullplatform/nullplatform_account?ref=chore/IaC-v2"
  np_api_key = var.api_key
  nullplatform_accounts = var.nullplatform_accounts
}


################################################################################
# Nullplatform Agent Helm Chart Configuration
################################################################################

module "nullplatform_agent" {
  source                              = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/nullplatform/aws/nullplatform_agent?ref=chore/IaC-v2"
  cluster_name                        = module.foundations_eks.eks_cluster_name
  tags                                = var.tags
  nrn                                 = var.nrn
  agent_repos_extra                   = var.agent_repos_extra
  environment_tag                     = var.environment_tags
  np_api_key                          = var.api_key
  aws_iam_openid_connect_provider_arn = module.foundations_eks.eks_oidc_provider_arn
}

################################################################################
# Nullplatform Base Helm Chart Configuration
################################################################################

module "nullplatform_base_chart" {
  source = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/nullplatform/nullplatform_base?ref=chore/IaC-v2"
  nrn    = var.nrn

  depends_on = [module.foundations_eks]
}

################################################################################
# Prometheus Configuration
################################################################################

module "nullplatform_prometheus" {
  source       = "git::https://github.com/nullplatform/main-terraform-modules.git//v2/workload/prometheus?ref=chore/IaC-v2"
  cluster_name = module.foundations_eks.eks_cluster_name
  nrn          = var.nrn
}