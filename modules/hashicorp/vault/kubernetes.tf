

# Kubernetes namespace
resource "kubernetes_namespace" "vault" {
  metadata {
    name = var.vault_namespace
  }
}

# Kubernetes service account with IAM role annotation
resource "kubernetes_service_account" "vault" {
  metadata {
    name      = var.vault_service_account
    namespace = var.vault_namespace
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.vault_kms_role.arn
    }
  }
  depends_on = [kubernetes_namespace.vault]
}

resource "null_resource" "vault_init" {
  provisioner "local-exec" {
    command = <<-EOT
      # Wait for Vault pods to be ready
      kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=vault -n ${var.vault_namespace} --timeout=${var.wait_timeout}

      # Check if Vault is already initialized
      if kubectl exec -n ${var.vault_namespace} vault-0 -- vault status | grep -q "Initialized.*true"; then
        echo "Vault is already initialized"

        # Try to get existing root token from secret
        if kubectl get secret vault-root-token -n ${var.vault_namespace} >/dev/null 2>&1; then
          ROOT_TOKEN=$(kubectl get secret vault-root-token -n ${var.vault_namespace} -o jsonpath='{.data.token}' | base64 -d)
          echo "Retrieved existing root token"
        else
          echo "Warning: Vault is initialized but no root token found in secrets"
          ROOT_TOKEN=""
        fi
      else
        echo "Initializing Vault..."

        # Initialize Vault and save output
        kubectl exec -n ${var.vault_namespace} vault-0 -- vault operator init -format=json > /tmp/vault-init.json

        # Extract root token
        ROOT_TOKEN=$(cat /tmp/vault-init.json | jq -r '.root_token')

        # Create Kubernetes secret for root token
        kubectl create secret generic vault-root-token -n ${var.vault_namespace} \
          --from-literal=token="$ROOT_TOKEN" \
          --dry-run=client -o yaml | kubectl apply -f -

        echo "Vault initialized successfully with auto-unseal"
        echo "Root token stored in vault-root-token secret"
      fi

      # Save root token to file for Terraform to read
      echo -n "$ROOT_TOKEN" > /tmp/vault-root-token.txt

      # Output the token (will be captured by Terraform)
      echo "VAULT_ROOT_TOKEN=$ROOT_TOKEN"
    EOT
  }

  # Force re-run when dependencies change
  triggers = {
    vault_deployment = helm_release.vault.metadata[0].revision
  }

  depends_on = [helm_release.vault]
}
