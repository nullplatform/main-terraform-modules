################################################################################
# Scope Definition Module Outputs
################################################################################

output "service_specification_id" {
  value       = nullplatform_service_specification.from_template.id
  description = "The ID of the created service specification"
}

output "service_specification_slug" {
  value       = nullplatform_service_specification.from_template.slug
  description = "The slug of the created service specification"
}

output "scope_type_id" {
  value       = nullplatform_scope_type.from_template.id
  description = "The ID of the created scope type"
}

output "action_specification_ids" {
  value = {
    for k, v in nullplatform_action_specification.from_templates : k => v.id
  }
  description = "Map of action specification names to their IDs"
}

output "nrn" {
  value       = var.nrn
  description = "The NRN of the created service specification"
}
output "github_repo_url" {
  value       = var.github_repo_url
  description = "The GitHub repository URL associated with the service specification"
}
output "github_ref" {
  value       = var.github_ref
  description = "The GitHub branch associated with the service specification"
}
output "github_scope_path" {
  value       = var.github_scope_path
  description = "The GitHub path associated with the service specification"
}

output "scope_name" {
  value       = var.scope_name
  description = "The name of the scope definition"
}

output "scope_description" {
  value       = var.scope_description
  description = "The name of the scope definition"
}