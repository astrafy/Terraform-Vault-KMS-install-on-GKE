resource "google_kms_key_ring" "vault" {

  name     = var.key_ring_name
  location = var.kms_location
  project  = var.project_id_gke

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_crypto_key" "unseal" {

  name     = var.unseal_key_name
  key_ring = google_kms_key_ring.vault.id

  rotation_period = var.unseal_key_rotation_period

  lifecycle {
    prevent_destroy = true
  }
}

