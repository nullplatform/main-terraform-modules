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
| [nullplatform_provider_config.ecr](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/provider_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_manager_role"></a> [application\_manager\_role](#input\_application\_manager\_role) | The IAM role arn used to create repositories on an application creation | `string` | n/a | yes |
| <a name="input_build_workflow_user_access_key_id"></a> [build\_workflow\_user\_access\_key\_id](#input\_build\_workflow\_user\_access\_key\_id) | AWS Access key used by Nullplatform to push images to ECR | `string` | n/a | yes |
| <a name="input_build_workflow_user_secret_access_key"></a> [build\_workflow\_user\_secret\_access\_key](#input\_build\_workflow\_user\_secret\_access\_key) | AWS Secret key used by Nullplatform to push images to ECR | `string` | n/a | yes |
| <a name="input_nrn"></a> [nrn](#input\_nrn) | The null platform nrn | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | ECR AWS region | `string` | n/a | yes |

## Outputs

No outputs.
