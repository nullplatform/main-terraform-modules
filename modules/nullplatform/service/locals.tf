locals {
  filters = jsonencode({ "service.specification.id" : nullplatform_service_specification.service_specification.id })
}
