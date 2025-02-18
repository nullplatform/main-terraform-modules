resource "nullplatform_provider_config" "ec2" {
  provider = nullplatform
  nrn      = var.nrn
  type     = "ec2-configuration"
  dimensions = {
    environment = var.environment
  }
  attributes = jsonencode({
    ami = {
      id = var.ami_id
    },
    storage = {
      parameters_bucket            = var.parameters_bucket
      parameters_encryption_secret = var.parameters_encryption_secret
    },
    security = {
      # ssh_key = var.ec2_ssh_key_name
      iam_profile = var.instance_profile

    }
  })
}
