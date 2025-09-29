variable "nullplatform-base-helm-version" {
  description = "Helm chart version for the Nullplatform agent"
  type        = string
  default     = "2.12.0"
}

variable "namespace" {
  description = "Kubernetes namespace to agent run"
  type        = string
  default     = "nullplatform-tools"
}

variable "nrn" {
  description = "Identifier Nullplatform Resources Name"
  type        = string
}

variable "np_api_key" {
  type        = string
  sensitive   = true
  description = "Nullplatform API key for authentication"
}
variable "cluster_name" {
  type = string

}
variable "location" {
  type = string
}

variable "project_id" {
  type = string
}