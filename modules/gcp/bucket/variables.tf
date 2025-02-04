variable "name" {
  description = "Name of the bucket"
  type        = string
}

variable "region" {
  description = "Region of the bucket"
  type        = string
}

variable "storage_class" {
  description = "Storage class of the bucket (e.g., STANDARD, NEARLINE, COLDLINE, ARCHIVE)"
  type        = string
  default     = "STANDARD"
}

variable "max_days_in_bucket" {
  description = "Number of days before objects automatically expire"
  type        = number
  default     = 30
}

variable "max_accepted_versions" {
  description = "Maximum number of versions of a bucket"
  type        = number
  default     = 10
}

