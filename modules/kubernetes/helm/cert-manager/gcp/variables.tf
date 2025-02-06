variable "project_id" {
  description = "The gcp project id"
  type        = string
}

variable "service_account_key" {
  description = "Base 64 service account key"
  type        = string
}

variable "domain_name" {
  description = "The hosted zone domain name."
  type        = string
}
