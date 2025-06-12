## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.11 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.23 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.99.1 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.17.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.37.1 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.3 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_trusting_oidc"></a> [trusting\_oidc](#module\_trusting\_oidc) | ../../../aws/data/iam/eks/trusting | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.vault_kms_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.vault_kms_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.vault_kms_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_alias.vault_unseal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.vault_unseal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [helm_release.vault](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.vault](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_service_account.vault](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [null_resource.vault_init](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [local_file.vault_root_token](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_cidr_blocks"></a> [allowed\_cidr\_blocks](#input\_allowed\_cidr\_blocks) | List of CIDR blocks allowed to access the load balancer | `list(string)` | <pre>[<br/>  "0.0.0.0/0"<br/>]</pre> | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | AWS KMS Key ID for auto-unseal | `string` | `""` | no |
| <a name="input_load_balancer_scheme"></a> [load\_balancer\_scheme](#input\_load\_balancer\_scheme) | Load balancer scheme - 'internet-facing' for public access or 'internal' for private access | `string` | `"internal"` | no |
| <a name="input_public_subnet_ids"></a> [public\_subnet\_ids](#input\_public\_subnet\_ids) | List of public subnet IDs for the load balancer | `list(string)` | n/a | yes |
| <a name="input_vault_namespace"></a> [vault\_namespace](#input\_vault\_namespace) | Kubernetes namespace for Vault | `string` | `"vault"` | no |
| <a name="input_vault_service_account"></a> [vault\_service\_account](#input\_vault\_service\_account) | Vault service account name | `string` | `"vault"` | no |
| <a name="input_wait_timeout"></a> [wait\_timeout](#input\_wait\_timeout) | The time it waits for pods to be ready | `string` | `"300s"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vault_iam_role_arn"></a> [vault\_iam\_role\_arn](#output\_vault\_iam\_role\_arn) | IAM Role ARN for Vault service account |
| <a name="output_vault_kms_key_id"></a> [vault\_kms\_key\_id](#output\_vault\_kms\_key\_id) | KMS Key ID used for Vault auto-unseal |
| <a name="output_vault_root_token"></a> [vault\_root\_token](#output\_vault\_root\_token) | Vault root token for authentication |
| <a name="output_vault_service_url"></a> [vault\_service\_url](#output\_vault\_service\_url) | Vault service URL |
| <a name="output_vault_ui_port_forward_command"></a> [vault\_ui\_port\_forward\_command](#output\_vault\_ui\_port\_forward\_command) | Command to port-forward to Vault UI |
