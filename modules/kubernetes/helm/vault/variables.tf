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

variable "load_balancer_scheme" {
  description = "Load balancer scheme - 'internet-facing' for public access or 'internal' for private access"
  type        = string
  default     = "internal"
  validation {
    condition     = contains(["internet-facing", "internal"], var.load_balancer_scheme)
    error_message = "Load balancer scheme must be either 'internet-facing' or 'internal'."
  }
}

