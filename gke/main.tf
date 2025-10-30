resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = var.subnet_name
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

# --- GKE Cluster ---
resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.zone
  deletion_protection = false

  network    = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.vpc_subnet.name

  remove_default_node_pool = true   # prevents default SSD pool
  initial_node_count       = 1

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
#  release_channel {
#  channel = "REGULAR"
#}

  # Disable logging/monitoring to reduce resource use
  logging_service    = "none"
  monitoring_service = "none"

  # Use standard (not regional) cluster to reduce quota usage
  networking_mode = "VPC_NATIVE"

}

# --- Custom Node Pool (small disk, standard type) ---
resource "google_container_node_pool" "default_nodes" {
  name       = "default-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.zone
  node_count = 1

  node_config {
    preemptible  = false
    machine_type = "e2-micro"   # Always-free eligible
    disk_size_gb = 20           # much smaller
    disk_type    = "pd-standard" # use standard disk (not SSD)
    service_account = "default"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  # Reduce management overhead
  management {
    auto_repair  = true
    auto_upgrade = true
  }
}

# --- Firewall: Internal communication ---
resource "google_compute_firewall" "allow-internal" {
  name    = "allow-internal"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "all"
  }

  source_ranges = ["10.0.0.0/24"]
}

# --- Firewall: External access for app ---
resource "google_compute_firewall" "allow-external" {
  name    = "allow-external"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "8080", "10250"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# --- Firewall: Allow GKE master ↔ Node communication ---
resource "google_compute_firewall" "allow-gke-master" {
  name    = "allow-gke-master"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["443", "10250"]
  }

  source_ranges = [
    "35.191.0.0/16",   # GKE control plane
    "130.211.0.0/22"   # LB health checks
  ]
}

