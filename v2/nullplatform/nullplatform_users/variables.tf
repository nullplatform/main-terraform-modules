variable "nullplatform_users" {
  type = map(object({
    email               = string
    first_name  = string
    last_name = string
  }))
}

variable "np_api_key" {
}