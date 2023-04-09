module "gcs_buckets" {
  source            = "terraform-google-modules/cloud-storage/google"
  version           = "3.4.1"
  project_id        = var.project_id_gke
  names             = ["vault-backups"]
  prefix            = var.project_id_gke
  set_creator_roles = true
  creators          = ["serviceAccount:${module.service_accounts.email}"]
  lifecycle_rules = [
    {
      action = {
        type = "Delete"
      }
      condition = {
        age = var.vault_backup_gcs_retention_days
      }
    }
  ]
}

module "service_accounts" {
  source     = "terraform-google-modules/service-accounts/google"
  version    = "4.2.0"
  project_id = var.project_id_gke
  names      = ["vault-backup"]
}

module "workload_identity" {
  source     = "app.terraform.io/astrafy/gcp-workload-identity/astrafy"
  version    = "0.0.1"
  project_id = var.project_id_gke
  gcp_k8s_identity_mapping = {
    (kubernetes_service_account_v1.vault_backup.metadata.0.name) = {
      gcp_sa_email = module.service_accounts.email
      namespace    = var.vault_namespace
    }
  }
  depends_on = [kubernetes_service_account_v1.vault_backup]
}