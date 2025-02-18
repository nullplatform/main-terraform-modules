variable "nrn" {
  type        = string
  description = "The null platform nrn"
}

variable "environment" {
  type        = string
  description = "The environment dimension value to which the configuraion applies"
}

variable "ami_id" {
  type        = string
  description = "AMI Id used to launch to EC2 instances"
  default     = "ami-0a6dd292b2a2a778c" #null-runtime-58 
}

variable "parameters_bucket" {
  type        = string
  description = "The parameters bucket storage"
}

variable "parameters_encryption_secret" {
  type        = string
  description = "The parameters bucket storage encryption key"
}

variable "instance_profile" {
  type        = string
  description = "The IAM Instance profile to attach to EC2 instances"
}

