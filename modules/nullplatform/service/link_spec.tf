resource "nullplatform_link_specification" "link_specification" {
  name             = var.link_name
  assignable_to    = var.link_assignable_to
  specification_id = nullplatform_service_specification.service_specification.id
  unique           = var.link_unique
  visible_to       = var.visible_to

  dimensions = jsonencode(var.link_dimensions)
  attributes = jsonencode(var.link_attributes)

  selectors {
    category     = var.selectors.category
    imported     = var.selectors.imported
    provider     = var.selectors.provider
    sub_category = var.selectors.sub_category
  }
}
