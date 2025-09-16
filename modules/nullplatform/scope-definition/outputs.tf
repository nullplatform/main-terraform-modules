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

