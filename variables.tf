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

variable "vault_gcp_sa" {
  description = "GCP Service account that will be used by the Vault Server. Must exist"
  type        = string
}

variable "vault_backup_gcs_retention_days" {
  description = "Duration in days to keep the vault backups in GCS"
  type        = number
  default     = 15
}
