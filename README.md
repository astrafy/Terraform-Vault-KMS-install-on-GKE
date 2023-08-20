<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >=4.47.0, <5.0.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >=2.6.0, <3.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >=2.14.0, <3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >=2.14.0, <3.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcs_buckets"></a> [gcs\_buckets](#module\_gcs\_buckets) | terraform-google-modules/cloud-storage/google | 3.4.1 |
| <a name="module_kms"></a> [kms](#module\_kms) | terraform-google-modules/kms/google | 2.2.1 |
| <a name="module_service_accounts"></a> [service\_accounts](#module\_service\_accounts) | terraform-google-modules/service-accounts/google | 4.2.0 |

## Resources

| Name | Type |
|------|------|
| [kubernetes_cron_job_v1.backup](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cron_job_v1) | resource |
| [kubernetes_service_account_v1.vault_backup](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account_v1) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_ring_name"></a> [key\_ring\_name](#input\_key\_ring\_name) | Name of the Keyring to create. | `string` | n/a | yes |
| <a name="input_kms_location"></a> [kms\_location](#input\_kms\_location) | Location of the KMS key ring. | `string` | n/a | yes |
| <a name="input_project_id_gke"></a> [project\_id\_gke](#input\_project\_id\_gke) | Project ID for GKE project | `string` | n/a | yes |
| <a name="input_unseal_key_name"></a> [unseal\_key\_name](#input\_unseal\_key\_name) | Name of the Vault unseal key | `string` | n/a | yes |
| <a name="input_unseal_key_rotation_period"></a> [unseal\_key\_rotation\_period](#input\_unseal\_key\_rotation\_period) | Rotation period of the Vault unseal key. Defaults to 6 months | `string` | n/a | yes |
| <a name="input_vault_backup_gcs_retention_days"></a> [vault\_backup\_gcs\_retention\_days](#input\_vault\_backup\_gcs\_retention\_days) | Duration in days to keep the vault backups in GCS | `number` | `15` | no |
| <a name="input_vault_gcp_sa"></a> [vault\_gcp\_sa](#input\_vault\_gcp\_sa) | GCP Service account that will be used by the Vault Server. Must exist | `string` | n/a | yes |
| <a name="input_vault_namespace"></a> [vault\_namespace](#input\_vault\_namespace) | Namespace used by Hashicorp vault | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms"></a> [kms](#output\_kms) | n/a |
| <a name="output_kubernetes_service_account"></a> [kubernetes\_service\_account](#output\_kubernetes\_service\_account) | n/a |
| <a name="output_vault_backup_gcp_sa_email"></a> [vault\_backup\_gcp\_sa\_email](#output\_vault\_backup\_gcp\_sa\_email) | n/a |
<!-- END_TF_DOCS -->