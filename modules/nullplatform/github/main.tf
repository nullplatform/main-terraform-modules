resource "nullplatform_provider_config" "github" {
  nrn        = try(regex("(.*):namespace.*", var.nrn)[0], var.nrn)
  type       = "github-configuration"
  dimensions = {}
  attributes = jsonencode({
    "setup" : {
      "organization" : var.organization,
      "installation_id" : var.organization_installation_id,
    },
    }
  )
}

