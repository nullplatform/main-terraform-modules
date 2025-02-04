variable "public_domain_name" {
  type        = string
  description = "The name of the public domain"
}

variable "private_domain_name" {
  type        = string
  description = "The name of the private domain"
}

variable "network_id" {
  type        = string
  description = "The id of the network to associate the private dns"
}
