variable "vpc" {
  description = "A VPC with public and private subnets"
}
# Parámetros VPC
# vpc = {
#   azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
#   cidr            = "172.16.0.0/16"
#   public_subnets  = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]
#   private_subnets = ["172.16.10.0/24", "172.16.11.0/24", "172.16.12.0/24"]
# }

variable "organization" {
  type        = string
  description = "A organization name"
}

variable "account" {
  type        = string
  description = "The account name"
}