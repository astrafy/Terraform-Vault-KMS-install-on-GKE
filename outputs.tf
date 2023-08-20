output "vault_backup_gcp_sa_email" {
  value = module.service_accounts.email
}

output "kubernetes_service_account" {
  value = kubernetes_service_account_v1.vault_backup.metadata.0.name
}

output "kms" {
  value = {
    keyring  = module.kms.keyring_name
    keys     = [for k, v in module.kms.keys : k]
    location = var.kms_location
  }
}
