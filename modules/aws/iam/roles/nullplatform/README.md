## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.87.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.nullplatform_build_workflow_user_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_instance_profile.null-instance-profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.ecr-nullimages-read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.lambda-execution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.null-aws-logs-enablement](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.null-params-read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.nullplatform-assets-write](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.nullplatform_alb_manager_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.nullplatform_asg_manager_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.nullplatform_ecr_manager_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.nullplatform_ecr_write_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.nullplatform_eks_manager_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.nullplatform_lambda_manager_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.nullplatform_metrics_api_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.nullplatform_params_manager_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.nullplatform_route53_manager_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.null-instance-lambda-execution-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.null-instance-role-aws-logs-enablement](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.null-instance-role-ecr-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.null-instance-role-s3-parameters-read-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.null-instance-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.nullplatform_application_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.nullplatform_scope_workflow_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.nullplatform_telemetry_manager_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_user.nullplatform_build_workflow_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.nullplatform_build_workflow_user_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_iam_user_policy.nullplatform_build_workflow_user_policy_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_manager_assume_role"></a> [application\_manager\_assume\_role](#input\_application\_manager\_assume\_role) | n/a | `string` | `"arn:aws:iam::283477532906:role/application_manager"` | no |
| <a name="input_assets_bucket_arns"></a> [assets\_bucket\_arns](#input\_assets\_bucket\_arns) | Assets bucket arn | `list(string)` | n/a | yes |
| <a name="input_parameters_bucket_arns"></a> [parameters\_bucket\_arns](#input\_parameters\_bucket\_arns) | Parameters bucket arn | `list(string)` | n/a | yes |
| <a name="input_parameters_encryption_arns"></a> [parameters\_encryption\_arns](#input\_parameters\_encryption\_arns) | Parameters secret arn | `list(string)` | n/a | yes |
| <a name="input_scope_manager_assume_role"></a> [scope\_manager\_assume\_role](#input\_scope\_manager\_assume\_role) | n/a | `string` | `"arn:aws:iam::283477532906:role/scope_and_deploy_manager"` | no |
| <a name="input_telemetry_manager_assume_role"></a> [telemetry\_manager\_assume\_role](#input\_telemetry\_manager\_assume\_role) | n/a | `string` | `"arn:aws:iam::283477532906:role/telemetry_manager"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nullplatform_application_role_arn"></a> [nullplatform\_application\_role\_arn](#output\_nullplatform\_application\_role\_arn) | The ARN of the null-application-role |
| <a name="output_nullplatform_build_workflow_user_access_key_id"></a> [nullplatform\_build\_workflow\_user\_access\_key\_id](#output\_nullplatform\_build\_workflow\_user\_access\_key\_id) | The access key ID for the null-build-workflow-user |
| <a name="output_nullplatform_build_workflow_user_name"></a> [nullplatform\_build\_workflow\_user\_name](#output\_nullplatform\_build\_workflow\_user\_name) | The name of the null-build-workflow-user |
| <a name="output_nullplatform_build_workflow_user_secret_access_key"></a> [nullplatform\_build\_workflow\_user\_secret\_access\_key](#output\_nullplatform\_build\_workflow\_user\_secret\_access\_key) | The secret access key for the null-build-workflow-user |
| <a name="output_nullplatform_ecr_manager_policy_arn"></a> [nullplatform\_ecr\_manager\_policy\_arn](#output\_nullplatform\_ecr\_manager\_policy\_arn) | The ARN of the np-ecr-manager-policy |
| <a name="output_nullplatform_ecr_write_policy_arn"></a> [nullplatform\_ecr\_write\_policy\_arn](#output\_nullplatform\_ecr\_write\_policy\_arn) | The ARN of the np-ecr-write-policy |
| <a name="output_nullplatform_eks_manager_policy_arn"></a> [nullplatform\_eks\_manager\_policy\_arn](#output\_nullplatform\_eks\_manager\_policy\_arn) | The ARN of the np-eks-manager-policy |
| <a name="output_nullplatform_instance_profile_arn"></a> [nullplatform\_instance\_profile\_arn](#output\_nullplatform\_instance\_profile\_arn) | The ARN of the instance arn |
| <a name="output_nullplatform_metrics_api_policy_arn"></a> [nullplatform\_metrics\_api\_policy\_arn](#output\_nullplatform\_metrics\_api\_policy\_arn) | The ARN of the np-metrics-api-policy |
| <a name="output_nullplatform_role_arn"></a> [nullplatform\_role\_arn](#output\_nullplatform\_role\_arn) | The IAM Role arn used for Lambda and EC2 |
| <a name="output_nullplatform_route53_manager_policy_arn"></a> [nullplatform\_route53\_manager\_policy\_arn](#output\_nullplatform\_route53\_manager\_policy\_arn) | The ARN of the np-route53-manager-policy |
| <a name="output_nullplatform_scope_workflow_role_arn"></a> [nullplatform\_scope\_workflow\_role\_arn](#output\_nullplatform\_scope\_workflow\_role\_arn) | The ARN of the null-scope-workflow-role |
| <a name="output_nullplatform_telemetry_manager_role_arn"></a> [nullplatform\_telemetry\_manager\_role\_arn](#output\_nullplatform\_telemetry\_manager\_role\_arn) | The ARN of the null-telemetry-manager-role |
