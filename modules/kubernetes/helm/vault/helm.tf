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

        # Enable persistent storage with gp2
        dataStorage = {
          enabled      = true
          size         = "10Gi"
          storageClass = "gp2"
        }

        auditStorage = {
          enabled = false
        }

        # Remove custom volumes since we're using persistent storage
        volumes      = []
        volumeMounts = []

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
              region     = "${data.aws_region.current.name}"
              kms_key_id = "${var.kms_key_id != "" ? var.kms_key_id : aws_kms_key.vault_unseal[0].key_id}"
            }

            disable_mlock = true
          EOT
        }

        service = {
          enabled = true
          type    = "LoadBalancer"
          port    = 8200
          annotations = {
            "service.beta.kubernetes.io/aws-load-balancer-type"                              = "nlb"
            "service.beta.kubernetes.io/aws-load-balancer-subnets"                           = join(",", var.public_subnet_ids)
            "service.beta.kubernetes.io/aws-load-balancer-scheme"                            = "internet-facing"
            "service.beta.kubernetes.io/aws-load-balancer-internal"                          = "false"
            "service.beta.kubernetes.io/aws-load-balancer-ssl-cert"                          = ""
            "service.beta.kubernetes.io/aws-load-balancer-ssl-ports"                         = "8200"
            "service.beta.kubernetes.io/aws-load-balancer-ssl-redirect"                      = "true"
            "service.beta.kubernetes.io/aws-load-balancer-ssl-negotiation-policy"            = "ELBSecurityPolicy-TLS-1-2-2017-01"
            "service.beta.kubernetes.io/aws-load-balancer-cross-zone-load-balancing-enabled" = "true"
            "service.beta.kubernetes.io/aws-load-balancer-attributes"                        = "idle_timeout.timeout_seconds=60"
            "service.beta.kubernetes.io/aws-load-balancer-additional-resource-tags"          = "Name=${var.cluster_name}-vault"
            "service.beta.kubernetes.io/aws-load-balancer-source-ranges"                     = join(",", var.allowed_cidr_blocks)
          }
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
