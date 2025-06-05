## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.99.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_iam_openid_connect_provider.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_openid_connect_provider) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernetes namespace for the Service account | `string` | n/a | yes |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | Service account name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_trusting"></a> [trusting](#output\_trusting) | n/a |
