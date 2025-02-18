variable "nrn" {
  type        = string
  description = "The null platform nrn"
}

variable "environment" {
  type        = string
  description = "The environment dimension value to which the configuraion applies"
}

variable "project_id" {
  type        = string
  description = "ID del Proyecto en GCP"
}

variable "domain_name" {
  description = "Domain name"
  type        = string
}

variable "public_dns_zone_name" {
  description = "gcp public zone name"
  type        = string
}

variable "private_dns_zone_name" {
  description = "gcp private zone name"
  type        = string
}

variable "use_application_domain" {
  description = false
  type        = bool
}

variable "credentials_file" {
  description = "Base64 credentials file"
  type        = string
}
