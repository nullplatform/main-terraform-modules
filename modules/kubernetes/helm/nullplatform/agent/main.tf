locals {
  agent_values = templatefile("${path.module}/templates/values-${var.cloud_name}.tmpl.yaml", {
    agent_repos          = var.agent_repos
    cluster_name         = var.cluster_name
    namespace            = var.namespace
    service_account_name = var.service_account_name
    tags                 = var.tags
    np_api_key           = var.np_api_key
    resource_identity    = aws_iam_role.role.arn
    init_scripts         = var.init_scripts
    vault_token          = var.vault_token
    vault_url            = var.vault_url
  })
}
# Helm release
resource "helm_release" "agent" {
  name             = "nullplatform-agent"
  chart            = "nullplatform-agent"
  repository       = "https://nullplatform.github.io/helm-charts"
  namespace        = var.namespace
  create_namespace = true
  version = "2.12.0"

  force_update = true

  values = [local.agent_values]

  depends_on = [
    aws_iam_role.role,
    aws_iam_role_policy_attachment.agent_route53,
    aws_iam_role_policy_attachment.agent_load_balancer
  ]
}