variable "nrn" {
  type        = string
  description = "The null platform nrn"
}

variable "environment" {
  type        = string
  description = "The environment dimension value to which the configuraion applies"
}

variable "vpc_id" {
  type        = string
  description = "The VPC id used for ec2 and lambda"
}

variable "subnet_ids" {
  type        = list(string)
  description = "The subnet ids used for ec2 and lambda"
}

variable "security_group_ids" {
  type        = list(string)
  description = "The sg ids used for ec2 and lambda"
}

variable "private_load_balancer_arn" {
  type        = string
  description = "The private alb arn used for ec2 and lambda"
}

variable "private_load_balancer_listener_arn" {
  type        = string
  description = "The private alb listener arn used for ec2 and lambda"
}

variable "public_load_balancer_arn" {
  type        = string
  description = "The private alb arn used for ec2 and lambda"
}

variable "public_load_balancer_listener_arn" {
  type        = string
  description = "The private alb listener arn used for ec2 and lambda"
}
