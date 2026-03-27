################################################################################
# Scope Definition Import Module Outputs
#
# Mirrors the output interface of the scope-definition module.
################################################################################

output "service_specification_id" {
  value       = data.nullplatform_service_specification.existing.id
  description = "The ID of the service specification"
}

output "service_specification_slug" {
  value       = data.nullplatform_service_specification.existing.slug
  description = "The slug of the service specification"
}

output "slug" {
  value       = data.nullplatform_service_specification.existing.slug
  description = "The slug of the service specification"
}

output "scope_type_id" {
  value       = data.nullplatform_scope_type.existing.id
  description = "The ID of the scope type"
}

output "action_specification_ids" {
  value       = local.action_specification_ids
  description = "Map of action specification names to their IDs"
}

output "nrn" {
  value       = var.nrn
  description = "The NRN associated with the scope definition"
}

output "git_repo_url" {
  value       = var.git_repo
  description = "The GitHub repository URL associated with the scope definition"
}

output "git_ref" {
  value       = var.git_ref
  description = "The GitHub branch associated with the scope definition"
}

output "git_scope_path" {
  value       = var.git_scope_path
  description = "The GitHub path associated with the scope definition"
}

output "scope_name" {
  value       = data.nullplatform_scope_type.existing.name
  description = "The name of the scope type"
}

output "scope_description" {
  value       = data.nullplatform_scope_type.existing.description
  description = "The description of the scope type"
}

output "specification" {
  value       = local.service_spec_parsed
  description = "The full parsed service specification (including agent_command and all template fields)"
}

output "workflow_override_path" {
  value       = var.workflow_override_path
  description = "The path to the custom workflow file"
}

output "workflow_override_values" {
  value       = var.workflow_override_values
  description = "The workflow override values"
}

output "scope_provider_id" {
  value       = data.nullplatform_service_specification.existing.id
  description = "The ID of the scope provider (service specification)"
}
