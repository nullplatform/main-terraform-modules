data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}

module "trusting_oidc" {
  source = "../../aws/data/iam/eks/trusting"

  cluster_name         = var.cluster_name
  namespace            = var.vault_namespace
  service_account_name = var.vault_service_account
}