output "vault_kms_key_id" {
  description = "KMS Key ID used for Vault auto-unseal"
  value       = var.kms_key_id != "" ? var.kms_key_id : aws_kms_key.vault_unseal[0].key_id
}

output "vault_iam_role_arn" {
  description = "IAM Role ARN for Vault service account"
  value       = aws_iam_role.vault_kms_role.arn
}

output "vault_service_url" {
  description = "Vault service URL"
  value       = "http://vault.${var.vault_namespace}.svc.cluster.local:8200"
}

output "vault_ui_port_forward_command" {
  description = "Command to port-forward to Vault UI"
  value       = "kubectl port-forward -n ${var.vault_namespace} svc/vault 8200:8200"
}

data "local_file" "vault_root_token" {
  filename   = "/tmp/vault-root-token.txt"
  depends_on = [null_resource.vault_init]
}

# Output the root token
output "vault_root_token" {
  description = "Vault root token for authentication"
  value       = data.local_file.vault_root_token.content
  sensitive   = true
}