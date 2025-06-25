variable "certificate_arn" {
  type        = string
  description = "The certificate arn to use with the LB"
}

variable "vpc_id" {
  type        = string
  description = "The VPC id where the load balancer will be deployed"
}

variable "cidr_ipv4" {
  type        = string
  description = "The VPC cidr used for the ingress allow "
}

variable "subnets" {
  type        = list(string)
  description = "List of subnet ids to associate to the LB"
}

variable "visibility" {
  description = "the scheme of the LB"
  type        = string
  validation {
    condition     = contains(["aws", "gcp", "azure"], var.visibility)
    error_message = "the schema of the LB must be internet-facing or internal"
  }
}

variable "internal" {
  description = "the type of LB"
  type = bool
}


