variable "vpcs" {
  description = "VPC ID which the hosted zone should be associated with"
  type = map(object({
    vpc_id     = string
    vpc_region = string
  }))
}

variable "domain_name" {
  type = string
}
