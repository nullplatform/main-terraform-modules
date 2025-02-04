resource "google_compute_network" "vpc" {
  name                    = "${var.name}-${var.environment}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnets" {
  for_each      = { for idx, val in var.subnet_cidr_map : idx => val }
  name          = "${var.name}-${var.environment}-${each.key}"
  ip_cidr_range = each.value
  network       = google_compute_network.vpc.id
  region        = var.region
}
