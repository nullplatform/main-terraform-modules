terraform {
  required_providers {
    nullplatform = {
      source = "nullplatform/nullplatform"
    }
    http = {
      source = "hashicorp/http"
    }
  }
}

provider "nullplatform" {
  api_key = var.np_api_key
}

################################################################################
# Example: scope-definition module
#
# This example shows how to use the scope-definition module to create a scope
# type, service specification, and action specifications from templates stored
# in a GitHub repository.
#
# Set create_scope_configuration = true when the scope repository contains a
# /specs/scope-configuration.json.tpl file. This will also create a
# nullplatform_provider_specification resource from the template.
################################################################################

module "scope_definition" {
  source = "../../modules/nullplatform/scope-definition"

  nrn              = var.nrn
  organization_nrn = var.organization_nrn

  github_repo_url   = var.github_repo_url
  github_ref        = var.github_ref
  github_scope_path = var.github_scope_path

  scope_name        = var.scope_name
  scope_description = var.scope_description

  create_scope_configuration = var.create_scope_configuration

  np_api_key = var.np_api_key
}

output "service_specification_id" {
  value = module.scope_definition.service_specification_id
}

output "scope_type_id" {
  value = module.scope_definition.scope_type_id
}

output "provider_specification_id" {
  value = module.scope_definition.provider_specification_id
}
