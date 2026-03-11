/**
 * Project: OmniWatch
 * File: ${FILE_NAME}
 * Author: ANTUNES Axel
 * * (not) Copyright (c) ${YEAR}. All rights (not) reserved.
 * This code is property of the OmniWatch project.
 * Unauthorized copying of this file, via any medium is strictly authorized :).
 * (not) Proprietary and (not) confidential.
 */

# Le Réseau VPC (Isolé)
resource "google_compute_network" "vpc_network" {
  name = "omniwatch-vpc"
  auto_create_subnetworks = false
}

# Le sous-réseau
resource "google_compute_subnetwork" "public_subnet" {
  name = "omniwatch-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region = var.region
  network = google_compute_network.vpc_network.id
}

# Le pare-feu pour autoriser le trafic entrant sur les ports 80 (HTTP) et 22 (SSH)
resource "google_compute_firewall" "allow_http_ssh" {
  name    = "allow-http-ssh"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["80", "22", "6443"]
  }

  target_tags = ["allow-http-ssh"]
  source_ranges = ["0.0.0.0/0"] # TODO: restreindre à des plages IP spécifiques pour plus de sécurité
}

resource "google_compute_instance" "k3s" {
  name = "k3s-vm-1"
  machine_type = "e2-micro"
  zone = var.zone

  # On attache le tag pour que le pare-feu puisse appliquer les règles
  tags = ["allow-http-ssh"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size = 10 # Taille du disque en GB
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.public_subnet.id
    access_config {
      # Permet d'obtenir une adresse IP publique
    }
  }

  # Script d'initialisation pour installer k3s
    metadata_startup_script = <<-EOT
        #!/bin/bash
        curl -sfL https://get.k3s.io | sh -
    EOT
}

output "instance_ip" {
  description = "The public IP address of the k3s VM instance."
  value = "${google_compute_instance.k3s.network_interface.0.access_config.0.nat_ip}"
}