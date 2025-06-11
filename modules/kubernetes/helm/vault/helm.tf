resource "helm_release" "vault" {
  name       = "vault"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  namespace  = var.vault_namespace
  version    = "0.28.0"

  values = [
    yamlencode({
      global = {
        enabled    = true
        tlsDisable = true
      }

      injector = {
        enabled = true
      }

      server = {
        serviceAccount = {
          create = false
          name   = var.vault_service_account
        }

        # Completely disable persistent storage
        dataStorage = {
          enabled = false
        }

        auditStorage = {
          enabled = false
        }

        # Add custom volumes for emptyDir
        volumes = [
          {
            name     = "vault-data"
            emptyDir = {}
          }
        ]

        volumeMounts = [
          {
            name      = "vault-data"
            mountPath = "/vault/file"
          }
        ]

        # Single instance, no HA
        ha = {
          enabled = false
        }

        # Simple configuration with file storage on ephemeral disk
        standalone = {
          enabled = true
          config  = <<-EOT
            ui = true

            listener "tcp" {
              tls_disable = 1
              address = "[::]:8200"
            }

            storage "file" {
              path = "/vault/file"
            }

            seal "awskms" {
              region     = ${data.aws_region.current.name}
              kms_key_id = "${var.kms_key_id != "" ? var.kms_key_id : aws_kms_key.vault_unseal[0].key_id}"
            }

            disable_mlock = true
          EOT
        }

        service = {
          enabled = true
          type    = "ClusterIP"
          port    = 8200
        }

        ingress = {
          enabled = false
        }
      }

      ui = {
        enabled     = true
        serviceType = "ClusterIP"
      }
    })
  ]

  depends_on = [
    kubernetes_namespace.vault,
    kubernetes_service_account.vault,
    aws_iam_role_policy_attachment.vault_kms_policy_attachment
  ]
}