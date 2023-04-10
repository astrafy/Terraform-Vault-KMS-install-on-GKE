output "helm_release" {
  value = helm_release.hashicorp_vault.id
}

output "vault_backup_gcp_sa_email" {
  value = module.service_accounts.email
}

output "kubernetes_service_account" {
  value = kubernetes_service_account_v1.vault_backup.metadata.0.name
}
