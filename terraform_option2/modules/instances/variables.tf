variable "instance_name" {
  description = "Name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "Type of machine to create"
  type        = string
  default     = "e2-micro"
}

variable "image" {
  description = "OS image for boot disk"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
}

variable "zone" {
  description = "Zone in which to deploy"
  type        = string
}

variable "tags" {
  description = "Network tags for the VM"
  type        = list(string)
  default     = []
}
