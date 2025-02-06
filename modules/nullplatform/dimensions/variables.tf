################################################################################
# General Variables from root module
################################################################################

variable "nrn" {
  type        = string
  description = "The null platform nrn"
}

variable "environments" {
  type        = list(string)
  description = "The list of environments"
  default     = ["development", "staging", "production"]
}
