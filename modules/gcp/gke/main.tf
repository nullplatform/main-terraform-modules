resource "google_container_cluster" "gke" {
  name     = "${var.cluster_name}-${var.environment}"
  location = var.region

  network    = var.network_id
  subnetwork = var.subnet_id

  initial_node_count = var.initial_node_count

  node_config {
    disk_size_gb    = var.disk_size_gb
    machine_type    = var.machine_type
    service_account = google_service_account.gke_service_account.email
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]

  }
}

resource "google_project_iam_member" "gke_artifact_access" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}

resource "google_service_account" "gke_service_account" {
  account_id   = "nullplatform-gke-sa"
  display_name = "Nullplatform GKE Service Account"
}

