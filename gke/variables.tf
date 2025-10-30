variable "project_id" {
  default = "java-docker-476212"
}
variable "region" {
  default = "us-central1"
}
variable "zone" {
  default = "us-central1-c"
}
variable "credentials_file" {
  default = "~/gcp/terraform-key.json"
}
variable "network_name" {
  default = "custom-vpc"
}
variable "subnet_name" {
  default = "custom-subnet"
}
variable "cluster_name" {
  default = "free-tier-gke"
}

