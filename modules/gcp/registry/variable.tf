variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "region" {
  type        = string
  description = "Region name"
}

variable "name" {
  type        = string
  description = "The repository name"
  default     = "nullplatform-central-repository"
}
