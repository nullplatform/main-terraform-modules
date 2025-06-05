resource "aws_kms_key" "vault_unseal" {
  count       = var.kms_key_id == "" ? 1 : 0
  description = "KMS key for Vault auto-unseal"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Action   = "kms:*"
        Resource = "*"
      }
    ]
  })

  tags = {
    Name = "vault-auto-unseal-${var.cluster_name}"
  }
}

resource "aws_kms_alias" "vault_unseal" {
  count         = var.kms_key_id == "" ? 1 : 0
  name          = "alias/vault-auto-unseal-${var.cluster_name}"
  target_key_id = aws_kms_key.vault_unseal[0].key_id
}