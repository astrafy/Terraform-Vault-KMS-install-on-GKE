resource "kubernetes_service_account_v1" "vault_backup" {
  metadata {
    name      = "vault-backup"
    namespace = var.vault_namespace
  }
}

resource "kubernetes_cron_job_v1" "backup" {
  metadata {
    name      = "snapshot-and-upload"
    namespace = var.vault_namespace
  }
  spec {
    failed_jobs_history_limit     = 5
    schedule                      = "@every 2h"
    timezone                      = "Etc/UTC"
    successful_jobs_history_limit = 5
    job_template {
      metadata {}
      spec {
        backoff_limit              = 2
        ttl_seconds_after_finished = 10
        template {
          metadata {}
          spec {
            volume {
              name = "share"
              empty_dir {}
            }
            container {
              name    = "snapshot"
              image   = "vault"
              command = ["/bin/sh"]
              args    = ["-c", "curl -sS https://webinstall.dev/jq | sh; vault login -method=gcp role=\"backup-operator\"; vault operator raft snapshot save /share/snapshot.snap"]
              env {
                name  = "VAULT_ADDR"
                value = "http://vault-active.${var.vault_namespace}.svc.cluster.local:8200"
              }
              volume_mount {
                mount_path = "/share"
                name       = "share"
              }
            }
            container {
              name    = "upload"
              image   = "google/cloud-sdk:425.0.0-alpine"
              command = ["/bin/sh"]
              args    = ["-c", "until [ -f /share/snapshot.snap ]; do sleep 5; done; gsutil cp /share/snapshot.snap ${module.gcs_buckets.url}/snapshot_$(date +\"%Y%m%d_%H%M%S\").snap;"]
              volume_mount {
                mount_path = "/share"
                name       = "share"
              }
            }
          }
        }
      }
    }
  }
}