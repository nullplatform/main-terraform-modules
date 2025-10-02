variable "scope_manager_assume_role" {
  description = "ARN of the IAM role for scope and deploy manager"
  type        = string
  default     = "arn:aws:iam::283477532906:role/scope_and_deploy_manager"
}

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

variable "hosted_private_zone_id" {
  description = "Hosted zone ID for private DNS"
  type        = string
}

variable "hosted_public_zone_id" {
  description = "Hosted zone ID for public DNS"
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
#########
# Registry Variables
#########
variable "application_manager_assume_role" {
  description = "ARN of the IAM role for application manager"
  type        = string
  default     = "arn:aws:iam::283477532906:role/application_manager"
}
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
#########
# Ingress Default
######
variable "certificate_arn" {
  description = "ARN of the SSL/TLS certificate for the network configuration"
  type        = string
}

variable "environments" {
  type        = list(string)
  description = "The list of environments"
  default     = ["development", "staging", "production"]
}

# NRN Patch Configuration
variable "np_api_key" {
  type        = string
  sensitive   = true
  description = "Nullplatform API key for authentication"
}

variable "namespaces" {
  type    = list(string)
  default = ["nullplatform"]
}