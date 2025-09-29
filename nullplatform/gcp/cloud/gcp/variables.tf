
variable "nrn" {
  description = "Identifier Nullplatform Resources Name"
  type        = string
}

variable "include_environment" {
  description = "Whether to use Environment as a default dimension"
  type        = bool
  default     = true
}

variable "domain_name" {
  description = "Domain name for the configuration"
  type        = string
}


variable "environment" {
  description = "Environment dimension value to which the configuration applies"
  type        = string
}

variable "dimensions" {
  description = "Map of dimension values to configure Nullplatform"
  type        = map(string)
  default     = {}
}
/*
#######
# Code respositoy
####3
variable "organization" {
  description = "Organization name for code repository configuration"
  type        = string
}

variable "organization_installation_id" {
  description = "GitHub App installation ID for the organization"
  type        = string
}
*/

variable "environments" {
  type        = list(string)
  description = "The list of environments"
  default     = ["development", "staging", "production"]
}

variable "location" {
  type = string

}


variable "project_id" {
  type = string

}

variable "np_api_key" {
  type = string

}

variable "private_dns_zone_name" {
  type = string

}
variable "public_dns_zone_name" {
  type = string
}
variable "service_account_key" {
  type = string

}