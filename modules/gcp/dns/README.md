## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_dns_managed_zone.private-zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_managed_zone) | resource |
| [google_dns_managed_zone.public-zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_managed_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | The id of the network to associate the private dns | `string` | n/a | yes |
| <a name="input_private_domain_name"></a> [private\_domain\_name](#input\_private\_domain\_name) | The name of the private domain | `string` | n/a | yes |
| <a name="input_public_domain_name"></a> [public\_domain\_name](#input\_public\_domain\_name) | The name of the public domain | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_domain_name"></a> [private\_domain\_name](#output\_private\_domain\_name) | n/a |
| <a name="output_public_domain_name"></a> [public\_domain\_name](#output\_public\_domain\_name) | n/a |
