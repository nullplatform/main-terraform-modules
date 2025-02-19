variable "nrn" {
  type        = string
  description = "The null platform nrn"
}

variable "region" {
  description = "ECR AWS region"
  type        = string
}

variable "build_workflow_user_access_key_id" {
  description = "AWS Access key used by Nullplatform to push images to ECR"
  type        = string
}

variable "build_workflow_user_secret_access_key" {
  description = "AWS Secret key used by Nullplatform to push images to ECR"
  type        = string
}

variable "application_manager_role" {
  description = "The IAM role arn used to create repositories on an application creation"
  type        = string
}
