variable "values_yaml" {
  type        = string
  description = "values.yaml for Nullplatform helm chart"
}

variable "domain_name" {
  description = "The hosted zone domain name."
  type        = string
}
