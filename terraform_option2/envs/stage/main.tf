terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.credentials_file)
}

module "compute_instance" {
  source        = "../../modules/instances"
  instance_name = var.instance_name
  machine_type  = var.machine_type
  image         = var.image
  zone          = var.zone
  tags          = ["dev"]
}
