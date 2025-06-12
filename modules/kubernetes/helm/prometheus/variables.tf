variable "namespace" {
  description = "The namespace to deploy Prometheus into"
  type        = string
  default     = "prometheus"
}

variable "allowed_cidrs" {
  description = "List of CIDR blocks allowed to access the Prometheus load balancer"
  type        = list(string)
  default     = ["0.0.0.0/0"] # Default to allow all, but should be restricted in production
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the load balancer"
  type        = list(string)
}
