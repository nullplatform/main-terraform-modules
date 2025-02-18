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

variable "lambda_assets_bucket" {
  description = "Bucket where assets for lambda functions are stored"
  type        = string
}
