variable "np_api_key" {
  type      = string
  sensitive = true
}

variable "nrn" {
  type        = string
  description = "Nullplatform Resource Name (organization:account format)"
}

variable "organization_nrn" {
  type        = string
  description = "Organization NRN used when create_scope_configuration is true"
  default     = ""
}

variable "github_repo_url" {
  type    = string
  default = "https://github.com/nullplatform/scopes-static-files"
}

variable "github_ref" {
  type    = string
  default = "main"
}

variable "github_scope_path" {
  type    = string
  default = "static-files"
}

variable "scope_name" {
  type = string
}

variable "scope_description" {
  type = string
}

variable "create_scope_configuration" {
  type    = bool
  default = false
}
