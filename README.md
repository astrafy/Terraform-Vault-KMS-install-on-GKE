<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >=4.47.0, <5.0.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >=2.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >=2.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms"></a> [kms](#module\_kms) | terraform-google-modules/kms/google | 2.2.1 |

## Resources

| Name | Type |
|------|------|
| [helm_release.hashicorp_vault](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Create the kubernetes namespace if it doesn't exist | `bool` | `false` | no |
| <a name="input_helm_values_file"></a> [helm\_values\_file](#input\_helm\_values\_file) | Helm values.yaml file location | `string` | n/a | yes |
| <a name="input_key_ring_name"></a> [key\_ring\_name](#input\_key\_ring\_name) | Name of the Keyring to create. | `string` | n/a | yes |
| <a name="input_kms_location"></a> [kms\_location](#input\_kms\_location) | Location of the KMS key ring. | `string` | n/a | yes |
| <a name="input_project_id_gke"></a> [project\_id\_gke](#input\_project\_id\_gke) | Project ID for GKE project | `string` | n/a | yes |
| <a name="input_unseal_key_name"></a> [unseal\_key\_name](#input\_unseal\_key\_name) | Name of the Vault unseal key | `string` | n/a | yes |
| <a name="input_unseal_key_rotation_period"></a> [unseal\_key\_rotation\_period](#input\_unseal\_key\_rotation\_period) | Rotation period of the Vault unseal key. Defaults to 6 months | `string` | n/a | yes |
| <a name="input_vault_config"></a> [vault\_config](#input\_vault\_config) | Vault configuration | <pre>object({<br>    chart_version = string<br>    release_name  = string<br>    vault_ksa     = string<br>    image = object({<br>      repository = string<br>      tag        = string<br>    }),<br>    data_storage = object({<br>      enabled = bool<br>      size    = string<br>    })<br>    ha = object({<br>      enabled = bool<br>      replicas : number<br>      raft = object({<br>        enabled = bool<br>      })<br>    }),<br>    ui = object({<br>      enabled = bool<br>    })<br>  })</pre> | n/a | yes |
| <a name="input_vault_gcp_sa"></a> [vault\_gcp\_sa](#input\_vault\_gcp\_sa) | GCP Service account that will be used by the Vault Server. Must exist | `string` | n/a | yes |
| <a name="input_vault_namespace"></a> [vault\_namespace](#input\_vault\_namespace) | Namespace used by Hashicorp vault | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_helm_release"></a> [helm\_release](#output\_helm\_release) | n/a |
<!-- END_TF_DOCS -->