variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Region where resources will be created"
  type        = string
}

variable "zone" {
  description = "Zone for the compute instance"
  type        = string
}

variable "credentials_file" {
  description = "Path to the GCP service account key file"
  type        = string
}

variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type (e.g. e2-micro)"
  type        = string
}

variable "image" {
  description = "Disk image to use for the VM"
  type        = string
}

variable "tags" {
  description = "Network tags"
  type        = list(string)
  default     = []
}

