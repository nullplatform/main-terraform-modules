variable "nrn" {
  type        = string
  description = "The null platform nrn"
}

variable "environment" {
  type        = string
  description = "The environment dimension value to which the configuraion applies"
}

variable "dimensions" {
  type        = map(string)
  description = "A map of dimension values to configure Nullplatform"
  default     = {}
}

variable "include_environment" {
  type        = bool
  description = "use Environment as default dimension"
  default     = true
}

variable "cluster_name" {
  type        = string
  description = "GKE Cluster name"
}

variable "namespace" {
  type        = string
  description = "Namespace where apps will be created"
  default     = "nullplatform"
}
