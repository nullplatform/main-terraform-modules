variable "nrn" {
  type        = string
  description = "The null platform nrn"
}

variable "environment" {
  type        = string
  description = "The environment dimension value to which the configuraion applies"
}

variable "lambda_function_role_arn" {
  type        = string
  description = "The IAM Role arn to deploy Lambda functions"
}

