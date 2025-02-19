## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.87.0 |
| <a name="provider_nullplatform"></a> [nullplatform](#provider\_nullplatform) | 0.0.50 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [nullplatform_provider_config.aws](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/provider_config) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dimensions"></a> [dimensions](#input\_dimensions) | A map of dimension values to configure Nullplatform | `map(string)` | `{}` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | n/a | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment dimension value to which the configuraion applies | `string` | n/a | yes |
| <a name="input_hosted_public_zone_id"></a> [hosted\_public\_zone\_id](#input\_hosted\_public\_zone\_id) | The Hosted zone if for the public dns | `string` | n/a | yes |
| <a name="input_hosted_zone_id"></a> [hosted\_zone\_id](#input\_hosted\_zone\_id) | The Hosted zone if for the private dns | `string` | n/a | yes |
| <a name="input_include_environment"></a> [include\_environment](#input\_include\_environment) | use Environment as default dimension | `bool` | `true` | no |
| <a name="input_nrn"></a> [nrn](#input\_nrn) | The null platform nrn | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_scope_manager_role"></a> [scope\_manager\_role](#input\_scope\_manager\_role) | Add admin role to the aws-auth configmap | `string` | n/a | yes |

## Outputs

No outputs.
