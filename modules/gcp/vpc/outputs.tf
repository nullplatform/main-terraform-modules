output "vpc_id" {
  value = google_compute_network.vpc.id
}

output "subnets" {
  value = {
    for key, subnet in google_compute_subnetwork.subnets :
    key => subnet.self_link
  }
}