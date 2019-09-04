resource "google_compute_network" "gcp-network" {
  name                    = "gcp-network-${random_id.instance_id.hex}"
  auto_create_subnetworks = "false"
}

resource "google_compute_firewall" "debug" {
  name    = "debug-firewall"
  network = "${google_compute_network.gcp-network.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  source_tags = ["ssh"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_subnetwork" "subnet1a" {
  name          = "subnet1a-${random_id.instance_id.hex}"
  ip_cidr_range = "10.241.1.0/24" #REPLACE
  network       = "${google_compute_network.gcp-network.name}"
  region        = "${var.gcp_region}" #REPLACE
}

resource "google_compute_subnetwork" "subnet1b" {
  name          = "subnet1b-${random_id.instance_id.hex}"
  ip_cidr_range = "10.241.2.0/24" #REPLACE
  network       = "${google_compute_network.gcp-network.name}"
  region        = "${var.gcp_region}" #REPLACE
}

