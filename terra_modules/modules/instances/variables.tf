variable "instance_name" {}
variable "machine_type" {}
variable "image" {}
variable "zone" {}
variable "tags" {
  type = list(string)
  default = []
}
