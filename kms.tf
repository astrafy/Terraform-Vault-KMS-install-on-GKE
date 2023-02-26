module "kms" {
  source  = "terraform-google-modules/kms/google"
  version = "2.2.1"

  project_id      = var.project_id_gke
  location        = var.kms_location
  keyring         = var.key_ring_name
  keys            = [var.unseal_key_name]
  set_owners_for  = [var.unseal_key_name]
  prevent_destroy = true
  owners = [
    "serviceAccount:${var.vault_gcp_sa}"
  ]
}
