locals {
  dimensions = merge(var.include_environment ? { environment = var.environment } : {}, var.dimensions)
}
