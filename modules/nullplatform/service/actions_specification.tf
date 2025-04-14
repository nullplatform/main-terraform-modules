resource "nullplatform_action_specification" "basic_actions" {
  for_each = var.basic_actions

  name                     = each.value.name
  type                     = each.key
  service_specification_id = nullplatform_service_specification.service_specification.id
  retryable                = each.value.retryable

  parameters = jsonencode(each.value.parameters)
  results    = jsonencode(each.value.results)
}

