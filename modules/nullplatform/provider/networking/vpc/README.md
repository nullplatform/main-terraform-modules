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
| [nullplatform_provider_config.network](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/provider_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment dimension value to which the configuraion applies | `string` | n/a | yes |
| <a name="input_nrn"></a> [nrn](#input\_nrn) | The null platform nrn | `string` | n/a | yes |
| <a name="input_private_load_balancer_arn"></a> [private\_load\_balancer\_arn](#input\_private\_load\_balancer\_arn) | The private alb arn used for ec2 and lambda | `string` | n/a | yes |
| <a name="input_private_load_balancer_listener_arn"></a> [private\_load\_balancer\_listener\_arn](#input\_private\_load\_balancer\_listener\_arn) | The private alb listener arn used for ec2 and lambda | `string` | n/a | yes |
| <a name="input_public_load_balancer_arn"></a> [public\_load\_balancer\_arn](#input\_public\_load\_balancer\_arn) | The private alb arn used for ec2 and lambda | `string` | n/a | yes |
| <a name="input_public_load_balancer_listener_arn"></a> [public\_load\_balancer\_listener\_arn](#input\_public\_load\_balancer\_listener\_arn) | The private alb listener arn used for ec2 and lambda | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | The sg ids used for ec2 and lambda | `list(string)` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The subnet ids used for ec2 and lambda | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC id used for ec2 and lambda | `string` | n/a | yes |

## Outputs

No outputs.
