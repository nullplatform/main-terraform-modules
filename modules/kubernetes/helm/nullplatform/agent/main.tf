
# Helm release
resource "helm_release" "agent" {
  name             = "nullplatform-agent"
  chart            = "nullplatform-agent"
  repository       = "https://nullplatform.github.io/helm-charts"
  namespace        = var.namespace
  create_namespace = true

  set {
    name  = "configuration.values.NP_API_KEY"
    value = var.np_api_key
  }

  set {
    name  = "configuration.values.TAGS"
    value = var.tags
  }

  set {
    name  = "configuration.values.GITHUB_USER"
    value = var.github_user
  }

  set {
    name  = "configuration.values.GITHUB_TOKEN"
    value = var.github_token
  }

  set {
    name  = "configuration.values.GITHUB_REPO"
    value = var.github_repo
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.role.arn
  }

  depends_on = [
    aws_iam_role.role,
    aws_iam_role_policy_attachment.agent_route53,
    aws_iam_role_policy_attachment.agent_load_balancer
  ]
}
