variable "domain_name" {
  description = "The hosted zone domain name."
  type        = string
}

variable "values_yaml_nullplatform" {
  type        = string
  description = "values.yaml for Nullplatform helm chart"
}

variable "values_yaml_cert_manager" {
  type        = string
  description = "values.yaml for cert_manager helm chart"
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
