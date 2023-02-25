resource "google_kms_crypto_key_iam_member" "auto_unseal" {
  crypto_key_id = google_kms_crypto_key.unseal.id
  role          = "roles/owner"
  member        = "serviceAccount:${var.vault_gcp_sa}"
}

# https://developer.hashicorp.com/vault/docs/auth/gcp#required-gcp-permissions
resource "google_project_iam_member" "vault_sa_key_admin" {
  member  = "serviceAccount:${var.vault_gcp_sa}"
  project = var.project_id_gke
  role    = "roles/iam.serviceAccountKeyAdmin"
}
