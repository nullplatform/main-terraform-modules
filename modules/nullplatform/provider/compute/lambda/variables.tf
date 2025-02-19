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

variable "lambda_function_role_arn" {
  type        = string
  description = "The IAM Role arn to deploy Lambda functions"
}

