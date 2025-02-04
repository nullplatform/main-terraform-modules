################################################################################
# General Variables from root module
################################################################################

variable "nrn" {
  type        = string
  description = "The null platform nrn"
}

variable "dimension_value" {
  type        = string
  description = "The dimension value"
  default     = null
}

variable "dimension_id" {
  type        = string
  description = "if provided is the dimension id"
}

variable "dimension_value_id" {
  type        = string
  description = "if provided will return the value id"
}
