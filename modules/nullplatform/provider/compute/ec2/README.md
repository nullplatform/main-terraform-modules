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
| [nullplatform_provider_config.ec2](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/provider_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI Id used to launch to EC2 instances | `string` | `"ami-0a6dd292b2a2a778c"` | no |
| <a name="input_dimensions"></a> [dimensions](#input\_dimensions) | A map of dimension values to configure Nullplatform | `map(string)` | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment dimension value to which the configuraion applies | `string` | n/a | yes |
| <a name="input_include_environment"></a> [include\_environment](#input\_include\_environment) | use Environment as default dimension | `bool` | `true` | no |
| <a name="input_instance_profile"></a> [instance\_profile](#input\_instance\_profile) | The IAM Instance profile to attach to EC2 instances | `string` | n/a | yes |
| <a name="input_nrn"></a> [nrn](#input\_nrn) | The null platform nrn | `string` | n/a | yes |
| <a name="input_parameters_bucket"></a> [parameters\_bucket](#input\_parameters\_bucket) | The parameters bucket storage | `string` | n/a | yes |
| <a name="input_parameters_encryption_secret"></a> [parameters\_encryption\_secret](#input\_parameters\_encryption\_secret) | The parameters bucket storage encryption key | `string` | n/a | yes |

## Outputs

No outputs.
