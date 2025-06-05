resource "aws_iam_role" "vault_kms_role" {
  name = "vault-kms-role-${var.cluster_name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Principal = {
          Federated = data.aws_iam_openid_connect_provider.eks.arn
        }
        Condition = {
          StringEquals = {
            "${replace(data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer, "https://", "")}:sub" = "system:serviceaccount:${var.vault_namespace}:${var.vault_service_account}"
            "${replace(data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer, "https://", "")}:aud" = "sts.amazonaws.com"
          }
        }
      }
    ]
  })
}


# IAM policy for KMS access
resource "aws_iam_policy" "vault_kms_policy" {
  name        = "vault-kms-policy-${var.cluster_name}"
  description = "Policy for Vault to access KMS for auto-unseal"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "kms:Decrypt",
          "kms:Encrypt",
          "kms:GenerateDataKey",
          "kms:DescribeKey"
        ]
        Resource = var.kms_key_id != "" ? "arn:aws:kms:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:key/${var.kms_key_id}" : aws_kms_key.vault_unseal[0].arn
      }
    ]
  })
}

# Attach policy to role
resource "aws_iam_role_policy_attachment" "vault_kms_policy_attachment" {
  role       = aws_iam_role.vault_kms_role.name
  policy_arn = aws_iam_policy.vault_kms_policy.arn
}