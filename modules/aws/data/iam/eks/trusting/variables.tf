variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace for the Service account"
  type        = string
}

variable "service_account_name" {
  description = "Service account name"
  type        = string
}