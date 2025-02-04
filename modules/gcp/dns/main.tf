resource "google_dns_managed_zone" "public-zone" {
  name        = replace(var.public_domain_name, ".", "-")
  dns_name    = "${var.public_domain_name}."
  description = local.description
}

resource "google_dns_managed_zone" "private-zone" {
  name        = replace(var.private_domain_name, ".", "-")
  dns_name    = "${var.private_domain_name}."
  description = local.description

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = var.network_id
    }
  }
}
