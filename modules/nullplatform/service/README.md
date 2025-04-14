## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_nullplatform"></a> [nullplatform](#provider\_nullplatform) | 0.0.57 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [nullplatform_action_specification.basic_actions](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/action_specification) | resource |
| [nullplatform_link_specification.link_specification](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/link_specification) | resource |
| [nullplatform_notification_channel.github](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/notification_channel) | resource |
| [nullplatform_notification_channel.webhook](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/notification_channel) | resource |
| [nullplatform_service_specification.service_specification](https://registry.terraform.io/providers/nullplatform/nullplatform/latest/docs/resources/service_specification) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assignable_to"></a> [assignable\_to](#input\_assignable\_to) | service assignable to. Options: any, dimension, scope | `string` | `"any"` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | service attributes json schema | `any` | n/a | yes |
| <a name="input_basic_actions"></a> [basic\_actions](#input\_basic\_actions) | Action schemas definitions | `map(string)` | `{}` | no |
| <a name="input_dimensions"></a> [dimensions](#input\_dimensions) | service dimensions | `map(any)` | n/a | yes |
| <a name="input_filters"></a> [filters](#input\_filters) | Additional filters to add to the service notification channels | `any` | n/a | yes |
| <a name="input_link_assignable_to"></a> [link\_assignable\_to](#input\_link\_assignable\_to) | link assignable to. Options: any, dimension, scope | `string` | `"any"` | no |
| <a name="input_link_attributes"></a> [link\_attributes](#input\_link\_attributes) | link attributes json schema | `any` | n/a | yes |
| <a name="input_link_dimensions"></a> [link\_dimensions](#input\_link\_dimensions) | link dimensions | `map(any)` | n/a | yes |
| <a name="input_link_name"></a> [link\_name](#input\_link\_name) | link name | `string` | n/a | yes |
| <a name="input_link_unique"></a> [link\_unique](#input\_link\_unique) | link is unique | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | service name | `string` | n/a | yes |
| <a name="input_notify_channels"></a> [notify\_channels](#input\_notify\_channels) | Notification channels configuration | <pre>object({<br/>    github = object({<br/>      enabled         = bool<br/>      account         = string<br/>      reference       = string<br/>      repository      = string<br/>      workflow_id     = string<br/>      installation_id = string<br/>    }),<br/>    webhook = object({<br/>      enabled = bool<br/>      url     = string<br/>      headers = map(string)<br/>    }),<br/>  })</pre> | <pre>{<br/>  "github": {<br/>    "account": "",<br/>    "enabled": false,<br/>    "installation_id": "",<br/>    "reference": "",<br/>    "repository": "",<br/>    "workflow_id": ""<br/>  },<br/>  "webhook": {<br/>    "enabled": false,<br/>    "headers": {},<br/>    "url": ""<br/>  }<br/>}</pre> | no |
| <a name="input_selectors"></a> [selectors](#input\_selectors) | Service selectors configuration | `map(string)` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | service type | `string` | `"dependency"` | no |
| <a name="input_visible_to"></a> [visible\_to](#input\_visible\_to) | Visibility of the service specification | `list(string)` | <pre>[<br/>  "organization=1:account=*"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_link_specification_id"></a> [link\_specification\_id](#output\_link\_specification\_id) | value of the link specification id |
| <a name="output_service_specification_id"></a> [service\_specification\_id](#output\_service\_specification\_id) | value of the service specification id |
