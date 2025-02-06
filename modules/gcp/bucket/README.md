## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.19.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_storage_bucket.bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_max_accepted_versions"></a> [max\_accepted\_versions](#input\_max\_accepted\_versions) | Maximum number of versions of a bucket | `number` | `10` | no |
| <a name="input_max_days_in_bucket"></a> [max\_days\_in\_bucket](#input\_max\_days\_in\_bucket) | Number of days before objects automatically expire | `number` | `30` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the bucket | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region of the bucket | `string` | n/a | yes |
| <a name="input_storage_class"></a> [storage\_class](#input\_storage\_class) | Storage class of the bucket (e.g., STANDARD, NEARLINE, COLDLINE, ARCHIVE) | `string` | `"STANDARD"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_versioning_status"></a> [bucket\_versioning\_status](#output\_bucket\_versioning\_status) | Indicates whether versioning is enabled |
| <a name="output_created_bucket_name"></a> [created\_bucket\_name](#output\_created\_bucket\_name) | Name of the bucket created in GCP |
