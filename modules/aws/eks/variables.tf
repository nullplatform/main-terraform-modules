variable "vpc_id" {
  description = "VPC ID which EKS cluster is deployed in"
  type        = string
}

variable "private_subnets" {
  description = "VPC Private Subnets which EKS cluster is deployed in"
  type        = list(any)
}

variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

variable "scope_manager_role" {
  type        = string
  description = "Add admin role to the aws-auth configmap"
}

variable "telemetry_manager_role" {
  type        = string
  description = "Add admin role to the aws-auth configmap"
}

variable "iam_role_permissions_boundary" {
  description = "ARN of the policy that is used to set the permissions boundary for the IAM role"
  type        = string
  default     = null
}