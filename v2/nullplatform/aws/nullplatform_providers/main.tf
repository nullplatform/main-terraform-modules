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