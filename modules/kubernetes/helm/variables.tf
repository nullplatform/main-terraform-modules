variable "domain_name" {
  description = "The hosted zone domain name."
  type        = string
}

variable "google_project_id" {
  description = "The gcp project id"
  type        = string
}

variable "google_dns_service_account_key" {
  description = "Base64 gcp service account key for cert-manager"
  type        = string
}

variable "google_registry_service_account_key_base64" {
  description = "Base64 gcp service account key for imagepullsecrets"
  type        = string
}

variable "values_yaml" {
  type        = string
  description = "values.yaml for Nullplatform helm chart"
}

variable "registry" {
  type        = string
  description = "Registry to pull images from"
}

variable "enable_cert_manager" {
  type        = bool
  default     = false
  description = "value to enable cert-manager"
}

variable "enable_istio" {
  type        = bool
  default     = false
  description = "value to enable istio"
}
