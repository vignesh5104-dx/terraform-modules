output "instance_self_link" {
  description = "The self link of the compute instance"
  value       = google_compute_instance.vm_instance.self_link
}

output "instance_ip" {
  description = "The external IP of the compute instance"
  value       = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}
