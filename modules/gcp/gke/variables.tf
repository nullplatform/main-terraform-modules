variable "project_id" {
  type        = string
  description = "Project ID for the GKE cluster"
}

variable "region" {
  type        = string
  description = "Region for the GKE cluster"
}

variable "cluster_name" {
  type        = string
  description = "value for the GKE cluster name"
}

variable "network_id" {
  type        = string
  description = "Network ID for the GKE cluster"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the GKE cluster"
}

variable "node_count" {
  type    = number
  default = 3
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "environment" {
  description = "Environment for the GKE cluster (e.g., dev, stg, prod)"
  type        = string
}

variable "initial_node_count" {
  type    = number
  default = 3
}
