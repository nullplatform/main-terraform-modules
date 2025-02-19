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
| [nullplatform_provider_config.gke](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/provider_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | GKE Cluster name | `string` | n/a | yes |
| <a name="input_dimensions"></a> [dimensions](#input\_dimensions) | A map of dimension values to configure Nullplatform | `map(string)` | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment dimension value to which the configuraion applies | `string` | n/a | yes |
| <a name="input_gateway_namespace"></a> [gateway\_namespace](#input\_gateway\_namespace) | Namespace where gateways will be created | `string` | `"gateways"` | no |
| <a name="input_include_environment"></a> [include\_environment](#input\_include\_environment) | use Environment as default dimension | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | GCP location where the cluster exists | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace where apps will be created | `string` | `"nullplatform"` | no |
| <a name="input_nrn"></a> [nrn](#input\_nrn) | The null platform nrn | `string` | n/a | yes |
| <a name="input_private_gateway_name"></a> [private\_gateway\_name](#input\_private\_gateway\_name) | Private gateway name | `string` | `"gateway-private"` | no |
| <a name="input_public_gateway_name"></a> [public\_gateway\_name](#input\_public\_gateway\_name) | Public gateway name | `string` | `"gateway-public"` | no |

## Outputs

No outputs.
