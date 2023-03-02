resource "helm_release" "hashicorp_vault" {
  chart             = "vault"
  name              = var.vault_config.release_name
  version           = var.vault_config.chart_version # chart version
  dependency_update = true
  repository        = "https://helm.releases.hashicorp.com"
  create_namespace  = var.create_namespace
  values = [
    templatefile(var.helm_values_file, {
      image_repository    = var.vault_config.image.repository,
      image_tag           = var.vault_config.image.tag,
      ha_enabled          = var.vault_config.ha.enabled,
      ha_enable_raft      = var.vault_config.ha.raft.enabled,
      ha_replicas         = var.vault_config.ha.replicas
      datastorage_enabled = var.vault_config.data_storage.enabled
      datastorage_size    = var.vault_config.data_storage.size
      vault_ksa           = var.vault_config.vault_ksa
      ui_enabled          = var.vault_config.ui.enabled
      gcp_project         = var.project_id_gke
      kms_location        = var.kms_location
      key_ring            = module.kms.keyring_resource.name
      crypto_key          = var.unseal_key_name
    })
  ]
  namespace = var.vault_namespace
}
