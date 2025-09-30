resource "nullplatform_provider_config" "aws" {
  provider   = nullplatform
  nrn        = var.nrn
  type       = "aws-configuration"
  dimensions = {}
  attributes = jsonencode({
    iam = {
      #scope_workflow_role = aws_iam_role.nullplatform_scope_workflow_role.arn
    }
    account = {
      id     = data.aws_caller_identity.current.id
      region = data.aws_region.current.region
    }
    networking = {
      application_domain    = false
      domain_name           = var.domain_name
      hosted_zone_id        = var.hosted_private_zone_id
      hosted_public_zone_id = var.hosted_public_zone_id
    }
  })
  lifecycle {
    ignore_changes = [attributes]
  }
}

resource "nullplatform_provider_config" "ecr" {
  provider   = nullplatform
  nrn        = var.nrn
  type       = "ecr"
  dimensions = {}
  attributes = jsonencode({
    "ci" : {
      "region" : data.aws_region.current.region,
      "access_key" : aws_iam_access_key.nullplatform_build_workflow_user_key.id
      "secret_key" : aws_iam_access_key.nullplatform_build_workflow_user_key.secret
    },
    "setup" : {
      "region" : data.aws_region.current.region,
      "role_arn" : aws_iam_role.nullplatform_application_role.arn
    }
  })
  lifecycle {
    ignore_changes = [attributes]
  }
}

resource "nullplatform_provider_config" "github" {
  nrn        = replace(var.nrn, ":namespace=.*$", "")
  type       = "github-configuration"
  dimensions = {}
  attributes = jsonencode({
    "setup" : {
      "organization" : var.organization,
      "installation_id" : var.organization_installation_id
    },
  }
  )
}

resource "kubernetes_ingress_v1" "internal" {
  metadata {
    name = "initial-ingress-setup-internal"
    namespace = "nullplatform"

    annotations = merge({
      "alb.ingress.kubernetes.io/actions.response-404" = jsonencode({
        type = "fixed-response"
        fixedResponseConfig = {
          contentType = "text/plain"
          statusCode  = "404"
          messageBody = "404 scope not found or has not been deployed yet"
        }
      })
      "alb.ingress.kubernetes.io/group.name"          = "k8s-nullplatform-internal"
      "alb.ingress.kubernetes.io/listen-ports"        = "[{\"HTTP\":80},{\"HTTPS\":443}]"
      "alb.ingress.kubernetes.io/load-balancer-name"  = "k8s-nullplatform-internal"
      "alb.ingress.kubernetes.io/scheme"              = "internal"
      "alb.ingress.kubernetes.io/ssl-redirect"        = "443"
      "alb.ingress.kubernetes.io/target-type"         = "ip"
      "alb.ingress.kubernetes.io/certificate-arn"     = var.certificate_arn
    })
  }

  spec {
    ingress_class_name = "alb"

    rule {
      host = "setup.nullapps.io"
      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "response-404"
              port {
                name = "use-annotation"
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "public" {
  metadata {
    name = "initial-ingress-setup-public"
    namespace = "nullplatform"

    annotations = merge({
      "alb.ingress.kubernetes.io/actions.response-404" = jsonencode({
        type = "fixed-response"
        fixedResponseConfig = {
          contentType = "text/plain"
          statusCode  = "404"
          messageBody = "404 scope not found or has not been deployed yet"
        }
      })
      "alb.ingress.kubernetes.io/group.name"          = "k8s-nullplatform-internet-facing"
      "alb.ingress.kubernetes.io/listen-ports"        = "[{\"HTTP\":80},{\"HTTPS\":443}]"
      "alb.ingress.kubernetes.io/load-balancer-name"  = "k8s-nullplatform-internet-facing"
      "alb.ingress.kubernetes.io/scheme"              = "internet-facing"
      "alb.ingress.kubernetes.io/ssl-redirect"        = "443"
      "alb.ingress.kubernetes.io/target-type"         = "ip"
      "alb.ingress.kubernetes.io/certificate-arn"     = var.certificate_arn
    })
  }

  spec {
    ingress_class_name = "alb"

    rule {
      host = "setup.nullapps.io"
      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "response-404"
              port {
                name = "use-annotation"
              }
            }
          }
        }
      }
    }
  }
}

resource "nullplatform_dimension" "environment" {
  name  = "Environment"
  order = 1
  nrn   = var.nrn
}

resource "nullplatform_dimension_value" "environment_value" {
  for_each     = toset(var.environments)
  dimension_id = nullplatform_dimension.environment.id
  name         = each.value
  nrn          = var.nrn
}
