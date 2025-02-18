resource "nullplatform_provider_config" "lambda" {
  provider = nullplatform
  nrn      = var.nrn
  type     = "aws-lambda-configuration"
  dimensions = {
    environment = var.environment
  }
  attributes = jsonencode({
    setup = {
      role_arn = var.lambda_function_role_arn
    }
  })
}
