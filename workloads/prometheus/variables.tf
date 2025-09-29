variable "namespace" {
  default = "prometheus"
}

variable "cluster_name" {}

variable "nrn" {}

variable "cloud" {
  description = "cloud (ej. gcp, aws, azure, etc.)"
  type        = string
}
variable "np_api_key" {
  type = string
}

variable "nullplatform_port" {
  type = number
  default = 2021
}

variable "kubeconfig_path" {
  type        = string
  default     = "~/.kube/config"
}
variable "kube_context" {
  type        = string
  default     = null  # o el nombre de tu context
}
