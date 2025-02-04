resource "nullplatform_dimension_value" "environment_value" {
  count        = var.dimension_value_id == null ? 1 : 0
  dimension_id = var.dimension_id
  name         = title(var.dimension_value)
  nrn          = var.nrn
}
