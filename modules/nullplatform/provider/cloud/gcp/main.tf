resource "nullplatform_provider_config" "gcp" {
  nrn        = var.nrn
  type       = "google-cloud-configuration"
  dimensions = var.dimensions
  attributes = jsonencode({
    "project" : {
      "id" : var.project_id
    },
    "networking" : {
      "domain_name" : var.domain_name,
      "application_domain" : var.use_application_domain,
      "public_dns_zone_name" : var.public_dns_zone_name
      "private_dns_zone_name" : var.private_dns_zone_name
    },
    "authentication" : {
      "service_account_key" : var.credentials_file
    }
  })
}
