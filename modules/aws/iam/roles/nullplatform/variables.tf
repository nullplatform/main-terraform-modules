variable "scope_manager_assume_role" {
  type    = string
  default = "arn:aws:iam::283477532906:role/scope_and_deploy_manager"
}

variable "telemetry_manager_assume_role" {
  type    = string
  default = "arn:aws:iam::283477532906:role/telemetry_manager"
}

variable "application_manager_assume_role" {
  type    = string
  default = "arn:aws:iam::283477532906:role/application_manager"
}

variable "assets_bucket_arns" {
  type        = list(string)
  description = "Assets bucket arn"
}
variable "parameters_bucket_arns" {
  type        = list(string)
  description = "Parameters bucket arn"
}
variable "parameters_encryption_arns" {
  type        = list(string)
  description = "Parameters secret arn"
}

variable "permissions_boundary_arn" {
  type        = string
  description = "ARN de la permissions boundary to roles"
  default     = null
}