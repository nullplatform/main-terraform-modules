variable "project_id" {
  type        = string
  description = "Project ID for the GKE cluster"
}

variable "region" {
  type        = string
  description = "Region for the GKE cluster"
}

variable "name" {
  description = "Name of the bucket"
  type        = string
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR for the VPC block"
}

variable "subnet_cidr_map" {
  type = list(string)
}

variable "environment" {
  description = "Environment for the VPC (e.g., dev, stg, prod)"
  type        = string
}
