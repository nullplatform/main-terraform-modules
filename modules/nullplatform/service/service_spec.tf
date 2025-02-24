# Resource: Service Specification
resource "nullplatform_service_specification" "service_spec" {
  name          = var.name
  type          = var.type
  assignable_to = var.assignable_to

  visible_to = var.visible_to

  dimensions = jsonencode(var.dimensions)

  attributes = jsonencode(var.attributes)

  selectors {
    category     = var.selectors.category
    imported     = var.selectors.imported
    provider     = var.selectors.provider
    sub_category = var.selectors.sub_category
  }
}
