variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "vault_namespace" {
  description = "Kubernetes namespace for Vault"
  type        = string
  default     = "vault"
}

variable "wait_timeout" {
  description = "The time it waits for pods to be ready"
  type        = string
  default     = "300s"
}

variable "kms_key_id" {
  description = "AWS KMS Key ID for auto-unseal"
  type        = string
  default     = ""
}

variable "vault_service_account" {
  description = "Vault service account name"
  type        = string
  default     = "vault"
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the load balancer"
  type        = list(string)
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the load balancer"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
