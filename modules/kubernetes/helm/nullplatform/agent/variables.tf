variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace for the agent"
  type        = string
  default     = "nullplatform-tools"
}

variable "service_account_name" {
  description = "Name of the service account"
  type        = string
  default     = "nullplatform-agent"
}

variable "tags" {
  description = "Agent tag, the identity of the agent"
  type        = string
}

variable "github_token" {
  description = "GitHub token"
  type        = string
  sensitive   = true
}

variable "github_user" {
  description = "GitHub user"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository"
  type        = string
}

variable "np_api_key" {
  description = "Nullplatform api key for the agent to communicate"
  type        = string
  sensitive   = true
}

variable "cloud_name" {
  description = "The provider cloud where the agent is deployed"
  type        = string
  validation {
    condition     = contains(["aws", "gcp", "azure"], var.cloud_name)
    error_message = "The provider cloud must be one of: aws, gcp, or azure."
  }
}

variable "init_scripts" {
  description = "List of shell commands to be executed before the container starts."
  type        = list(string)
  default     = []
}

variable "iam_role_permissions_boundary" {
  description = "ARN of the policy that is used to set the permissions boundary for the IAM role"
  type        = string
  default     = null
}

variable "vault_token" {}
variable "vault_url" {}