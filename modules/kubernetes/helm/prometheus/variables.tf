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

variable "load_balancer_scheme" {
  description = "Load balancer scheme - 'internet-facing' for public access or 'internal' for private access"
  type        = string
  default     = "internal"
  validation {
    condition     = contains(["internet-facing", "internal"], var.load_balancer_scheme)
    error_message = "Load balancer scheme must be either 'internet-facing' or 'internal'."
  }
}

variable "storageClassName" {
  description = "The storageClass name to use"
  type        = string
  default     = "gp2"
}
