terraform {
  required_providers {
    nullplatform = {
      source  = "nullplatform/nullplatform"
      version = "~> 0.0.63"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.0"
    }
  }
}
provider "google" {
  project = var.project_id
  region  = var.location

}

data "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.location
}
data "google_client_config" "this" {}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.gke.endpoint}"
  token = data.google_client_config.this.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.gke.master_auth[0].cluster_ca_certificate
  )
}
provider "helm" {
  kubernetes = {
    host  = "https://${data.google_container_cluster.gke.endpoint}"
    token = data.google_client_config.this.access_token
    cluster_ca_certificate = base64decode(
      data.google_container_cluster.gke.master_auth[0].cluster_ca_certificate
    )
  }
}
provider "nullplatform" {

  api_key = var.np_api_key
}