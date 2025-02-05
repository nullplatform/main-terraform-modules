resource "nullplatform_provider_config" "github" {
  nrn        = regex("(.*):namespace.*", var.nrn)[0] // Hack to move up to account
  type       = "github-configuration"
  dimensions = {}
  attributes = jsonencode({
    "setup" : {
      "organization" : var.github_organization,
      "installation_id" : var.github_organization_installation_id,
    },
    }
  )
}

