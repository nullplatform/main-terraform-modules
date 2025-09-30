variable "nullplatform_accounts" {
  type = map(object({
    name               = string
    repository_prefix  = string
    repository_provider = optional(string, "POC")
    slug               = optional(string, "poc-account")
  }))
}

variable "np_api_key" {

}