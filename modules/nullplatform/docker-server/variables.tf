################################################################################
# General Variables from root module
################################################################################

variable "nrn" {
  type        = string
  description = "The null platform nrn"
}

################################################################################
# Variables from other Modules
################################################################################


variable "login_server" {
  description = "Docker Login server name"
  type        = string
}

variable "path" {
  description = "Path to the registry created"
  type        = string
}

variable "username" {
  description = "Docker username"
  type        = string
  default     = "_json_key_base64"
}

variable "password" {
  description = "Docker password"
  type        = string
  sensitive   = false
}
