variable "nrn" {
  type        = string
  description = "The null platform nrn"
}

variable "environment" {
  type        = string
  description = "The environment dimension value to which the configuraion applies"
}

variable "region" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "scope_manager_role" {
  type        = string
  description = "Add admin role to the aws-auth configmap"
}

variable "hosted_zone_id" {
  type        = string
  description = "The Hosted zone if for the private dns"
}

variable "hosted_public_zone_id" {
  type        = string
  description = "The Hosted zone if for the public dns"
}
