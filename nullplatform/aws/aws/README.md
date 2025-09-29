<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_nullplatform"></a> [nullplatform](#requirement\_nullplatform) | ~> 0.0.63 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_nullplatform"></a> [nullplatform](#provider\_nullplatform) | ~> 0.0.63 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.nullplatform_build_workflow_user_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.nullplatform_ecr_manager_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.nullplatform_application_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecr-manager-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.nullplatform_build_workflow_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.ecr-manager-policy-user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [kubernetes_ingress_v1.internal](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress_v1) | resource |
| [kubernetes_ingress_v1.public](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress_v1) | resource |
| [nullplatform_dimension.environment](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/dimension) | resource |
| [nullplatform_dimension_value.environment_value](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/dimension_value) | resource |
| [nullplatform_provider_config.aws](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/provider_config) | resource |
| [nullplatform_provider_config.ecr](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/provider_config) | resource |
| [nullplatform_provider_config.github](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/provider_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_manager_assume_role"></a> [application\_manager\_assume\_role](#input\_application\_manager\_assume\_role) | ARN of the IAM role for application manager | `string` | `"arn:aws:iam::283477532906:role/application_manager"` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | ARN of the SSL/TLS certificate for the network configuration | `string` | n/a | yes |
| <a name="input_dimensions"></a> [dimensions](#input\_dimensions) | Map of dimension values to configure Nullplatform | `map(string)` | `{}` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name for the configuration | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment dimension value to which the configuration applies | `string` | n/a | yes |
| <a name="input_environments"></a> [environments](#input\_environments) | The list of environments | `list(string)` | <pre>[<br/>  "development",<br/>  "staging",<br/>  "production"<br/>]</pre> | no |
| <a name="input_hosted_private_zone_id"></a> [hosted\_private\_zone\_id](#input\_hosted\_private\_zone\_id) | Hosted zone ID for private DNS | `string` | n/a | yes |
| <a name="input_hosted_public_zone_id"></a> [hosted\_public\_zone\_id](#input\_hosted\_public\_zone\_id) | Hosted zone ID for public DNS | `string` | n/a | yes |
| <a name="input_include_environment"></a> [include\_environment](#input\_include\_environment) | Whether to use Environment as a default dimension | `bool` | `true` | no |
| <a name="input_nrn"></a> [nrn](#input\_nrn) | Identifier Nullplatform Resources Name | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Organization name for code repository configuration | `string` | n/a | yes |
| <a name="input_organization_installation_id"></a> [organization\_installation\_id](#input\_organization\_installation\_id) | GitHub App installation ID for the organization | `string` | n/a | yes |
| <a name="input_scope_manager_assume_role"></a> [scope\_manager\_assume\_role](#input\_scope\_manager\_assume\_role) | ARN of the IAM role for scope and deploy manager | `string` | `"arn:aws:iam::283477532906:role/scope_and_deploy_manager"` | no |
<!-- END_TF_DOCS -->