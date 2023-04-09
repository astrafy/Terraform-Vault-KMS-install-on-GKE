output "helm_release" {
  value = helm_release.hashicorp_vault.id
}

output "vault_backup_gcp_sa_email" {
  value = module.service_accounts.email
}
