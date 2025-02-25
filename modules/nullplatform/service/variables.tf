variable "name" {
  description = "service name"
  type        = string
}

variable "type" {
  description = "service type"
  type        = string
  default     = "dependency"
}

variable "assignable_to" {
  description = "service assignable to. Options: any, dimension, scope"
  type        = string
  default     = "any"
}

variable "visible_to" {
  description = "Visibility of the service specification"
  type        = list(string)
  default = [
    "organization=1:account=*",
  ]
}

variable "dimensions" {
  description = "service dimensions"
  type        = map(any)
}

variable "attributes" {
  description = "service attributes json schema"
  type        = any
}

variable "selectors" {
  description = "Service selectors configuration"
  type        = map(string)
}

variable "basic_actions" {
  description = "Action schemas definitions"
  type = object({
    create = object({
      name       = string
      retryable  = bool
      parameters = any
      results    = any
    })
    update = object({
      name       = string
      retryable  = bool
      parameters = any
      results    = any
    })
    delete = object({
      name       = string
      retryable  = bool
      parameters = any
      results    = any
    })
  })
}

variable "link_assignable_to" {
  description = "link assignable to. Options: any, dimension, scope"
  type        = string
  default     = "any"
}


variable "link_name" {
  description = "link name"
  type        = string
}

variable "link_dimensions" {
  description = "link dimensions"
  type        = map(any)
}

variable "link_attributes" {
  description = "link attributes json schema"
  type        = any
}

variable "link_unique" {
  description = "link is unique"
  type        = bool
  default     = false
}

