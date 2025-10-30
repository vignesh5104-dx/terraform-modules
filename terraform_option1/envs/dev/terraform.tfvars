project_id        = "java-docker-476212"
region            = "us-central1"
zone              = "us-central1-a"
credentials_file  = "/Users/v0r03wu/gcp/terraform-key.json"

instance_name     = "dev-vm"
machine_type      = "e2-micro"
image             = "ubuntu-os-cloud/ubuntu-minimal-2204-lts"
tags              = ["dev"]

