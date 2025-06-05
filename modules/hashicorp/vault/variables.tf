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
}

variable "vault_service_account" {
  description = "Vault service account name"
  type        = string
  default     = "vault"
}