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