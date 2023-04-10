terraform {
  required_version = ">= 1.2.9"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=4.47.0, <5.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">=2.6.0, <3.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.14.0, <3.0.0"
    }
  }

}
