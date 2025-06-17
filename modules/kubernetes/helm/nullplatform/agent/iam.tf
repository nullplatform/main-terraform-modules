resource "aws_iam_role" "role" {
  name = "nullplatform-agent-role-${var.cluster_name}"

  assume_role_policy = jsonencode(module.trusting_oidc.trusting)
}

# Route 53 Policy
resource "aws_iam_policy" "route53_policy" {
  name        = "${var.cluster_name}-agent-route53-policy"
  description = "Policy for Route 53 management"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "route53:ChangeResourceRecordSets",
          "route53:GetChange",
          "route53:GetHostedZone",
          "route53:ListHostedZones",
          "route53:ListHostedZonesByName",
          "route53:ListResourceRecordSets"
        ]
        Resource = "*"
      }
    ]
  })
}

# Load Balancer Controller Policy
resource "aws_iam_policy" "load_balancer_policy" {
  name        = "${var.cluster_name}-agent-load-balancer-policy"
  description = "Policy for Load Balancer management"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "elasticloadbalancing:DescribeLoadBalancers",
          "elasticloadbalancing:DescribeTargetGroups",
          "elasticloadbalancing:DescribeTargetHealth",
          "elasticloadbalancing:DescribeListeners",
          "elasticloadbalancing:DescribeRules"
        ]
        Resource = "*"
      }
    ]
  })
}

# Attach policies to the role
resource "aws_iam_role_policy_attachment" "agent_route53" {
  policy_arn = aws_iam_policy.route53_policy.arn
  role       = aws_iam_role.role.name
}

resource "aws_iam_role_policy_attachment" "agent_load_balancer" {
  policy_arn = aws_iam_policy.load_balancer_policy.arn
  role       = aws_iam_role.role.name
}
