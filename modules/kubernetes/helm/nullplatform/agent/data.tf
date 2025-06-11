data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}

data "aws_caller_identity" "current" {}

module "trusting_oidc" {
  source = "../../../../aws/data/iam/eks/trusting"

  cluster_name         = var.cluster_name
  namespace            = var.namespace
  service_account_name = var.service_account_name
}