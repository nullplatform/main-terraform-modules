output "public_domain_name" {
  value = google_dns_managed_zone.public-zone.name
}

output "private_domain_name" {
  value = google_dns_managed_zone.private-zone.name
}
