## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_nullplatform"></a> [nullplatform](#provider\_nullplatform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [nullplatform_provider_config.gcp](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/provider_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_credentials_file"></a> [credentials\_file](#input\_credentials\_file) | Base64 credentials file | `string` | n/a | yes |
| <a name="input_dimension"></a> [dimension](#input\_dimension) | The dimension to which the configuraion applies | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name | `string` | n/a | yes |
| <a name="input_nrn"></a> [nrn](#input\_nrn) | The null platform nrn | `string` | n/a | yes |
| <a name="input_private_dns_zone_name"></a> [private\_dns\_zone\_name](#input\_private\_dns\_zone\_name) | gcp private zone name | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID del Proyecto en GCP | `string` | n/a | yes |
| <a name="input_public_dns_zone_name"></a> [public\_dns\_zone\_name](#input\_public\_dns\_zone\_name) | gcp public zone name | `string` | n/a | yes |
| <a name="input_use_application_domain"></a> [use\_application\_domain](#input\_use\_application\_domain) | false | `bool` | n/a | yes |

## Outputs

No outputs.
