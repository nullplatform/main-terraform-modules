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
| [nullplatform_dimension.environment](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/dimension) | resource |
| [nullplatform_dimension_value.environment_value](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/dimension_value) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environments"></a> [environments](#input\_environments) | The list of environments | `list(string)` | <pre>[<br>  "development",<br>  "staging",<br>  "production"<br>]</pre> | no |
| <a name="input_nrn"></a> [nrn](#input\_nrn) | The null platform nrn | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | The Ids of the dimensions created |
| <a name="output_names"></a> [names](#output\_names) | The names of the dimensions created |
