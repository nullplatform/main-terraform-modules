variable "service_account_key_base64" {
  description = "Base 64 service account key"
  type        = string
}

variable "registry" {
  type        = string
  description = "GCP Registry to pull images from"
}
