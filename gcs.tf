module "gcs_buckets" {
  source            = "terraform-google-modules/cloud-storage/google"
  version           = "5.0.0"
  project_id        = var.project_id_gke
  names             = ["vault-backups"]
  prefix            = "${var.project_id_gke}-${var.kms_location}"
  location          = var.kms_location
  set_creator_roles = true
  set_viewer_roles  = true
  creators          = ["serviceAccount:${module.service_accounts.email}"]
  viewers           = ["serviceAccount:${module.service_accounts.email}"]
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
  version    = "4.2.2"
  project_id = var.project_id_gke
  names      = ["vault-backup"]
}
