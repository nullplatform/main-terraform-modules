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
| [nullplatform_action_specification.basic_actions](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/action_specification) | resource |
| [nullplatform_service_specification.service_spec](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/service_specification) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assignable_to"></a> [assignable\_to](#input\_assignable\_to) | service assignable to. Options: any, dimension, scope | `string` | `"any"` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | service attributes json schema | `any` | n/a | yes |
| <a name="input_basic_actions"></a> [basic\_actions](#input\_basic\_actions) | Action schemas definitions | <pre>object({<br/>    create = object({<br/>      name       = string<br/>      retryable  = bool<br/>      parameters = any<br/>      results    = any<br/>    })<br/>    update = object({<br/>      name       = string<br/>      retryable  = bool<br/>      parameters = any<br/>      results    = any<br/>    })<br/>    delete = object({<br/>      name       = string<br/>      retryable  = bool<br/>      parameters = any<br/>      results    = any<br/>    })<br/>  })</pre> | n/a | yes |
| <a name="input_dimensions"></a> [dimensions](#input\_dimensions) | service dimensions | `map(any)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | service name | `string` | n/a | yes |
| <a name="input_selectors"></a> [selectors](#input\_selectors) | Service selectors configuration | `map(string)` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | service type | `string` | `"dependency"` | no |
| <a name="input_visible_to"></a> [visible\_to](#input\_visible\_to) | Visibility of the service specification | `list(string)` | <pre>[<br/>  "organization=1255165411:account=*"<br/>]</pre> | no |

## Outputs

No outputs.
