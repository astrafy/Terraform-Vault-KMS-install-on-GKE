variable "project_id_gke" {
  description = "Project ID for GKE project"
  type        = string
}

variable "vault_namespace" {
  description = "Namespace used by Hashicorp vault"
  type        = string
}

variable "key_ring_name" {
  description = "Name of the Keyring to create.	"
  type        = string
}

variable "kms_location" {
  description = "Location of the KMS key ring."
  type        = string
}

variable "unseal_key_name" {
  description = "Name of the Vault unseal key"
  type        = string
}

variable "unseal_key_rotation_period" {
  description = "Rotation period of the Vault unseal key. Defaults to 6 months"
  type        = string
}

variable "helm_values_file" {
  description = "Helm values.yaml file location"
  type        = string
}

variable "vault_config" {
  description = "Vault configuration"
  type = object({
    chart_version = string
    release_name  = string
    vault_ksa     = string
    image = object({
      repository = string
      tag        = string
    }),
    data_storage = object({
      enabled = bool
      size    = string
    })
    ha = object({
      enabled = bool
      replicas : number
      raft = object({
        enabled = bool
      })
    }),
    ui = object({
      enabled = bool
    })
  })
}

variable "vault_gcp_sa" {
  description = "GCP Service account that will be used by the Vault Server. Must exist"
  type        = string
}
