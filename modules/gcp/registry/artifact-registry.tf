resource "google_artifact_registry_repository" "registry" {
  project       = var.project_id
  location      = var.region
  repository_id = var.name
  format        = "DOCKER"

  labels = {
    environment = "global"
  }
}
