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


