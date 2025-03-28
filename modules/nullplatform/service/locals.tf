locals {
  filters = jsonencode(merge({ "service.specification.id" : nullplatform_service_specification.service_specification.id }, var.filters))
}
