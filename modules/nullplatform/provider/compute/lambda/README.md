## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_nullplatform"></a> [nullplatform](#provider\_nullplatform) | 0.0.50 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [nullplatform_provider_config.lambda](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/provider_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dimensions"></a> [dimensions](#input\_dimensions) | A map of dimension values to configure Nullplatform | `map(string)` | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment dimension value to which the configuraion applies | `string` | n/a | yes |
| <a name="input_include_environment"></a> [include\_environment](#input\_include\_environment) | use Environment as default dimension | `bool` | `true` | no |
| <a name="input_lambda_function_role_arn"></a> [lambda\_function\_role\_arn](#input\_lambda\_function\_role\_arn) | The IAM Role arn to deploy Lambda functions | `string` | n/a | yes |
| <a name="input_nrn"></a> [nrn](#input\_nrn) | The null platform nrn | `string` | n/a | yes |

## Outputs

No outputs.
