module "compute_instance" {
  source        = "./modules/instances"
  instance_name = var.instance_name
  machine_type  = var.machine_type
  image         = var.image
  zone          = var.zone
  tags          = var.tags
}

