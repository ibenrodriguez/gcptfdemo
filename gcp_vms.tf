resource "google_compute_address" "vm1a-ipv4" {
    name = "vm1a-ipv4-${random_id.instance_id.hex}"
}

resource "google_compute_address" "vm1b-ipv4" {
    name = "vm1b-ipv4-${random_id.instance_id.hex}"
}

resource "google_compute_instance" "vm1a" {
    name         = "vm1a-${random_id.instance_id.hex}"
    machine_type = "${var.gcp_vms_size}"
    zone         = "${var.gcp_region}-a"

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
        }
    }

    metadata = {
        ssh-keys = "myadmin:${file("${var.public_ssh_key}")}"
    }

    network_interface {
        subnetwork = "${google_compute_subnetwork.subnet1a.name}"
        network_ip = "10.241.1.101"
        access_config {
            nat_ip = "${google_compute_address.vm1a-ipv4.address}"
        }
    }
}

resource "google_compute_instance" "vm1b" {
    name         = "vm1b-${random_id.instance_id.hex}"
    machine_type = "${var.gcp_vms_size}"
    zone         = "${var.gcp_region}-a"

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
        }
    }

    metadata = {
        ssh-keys = "myadmin:${file("${var.public_ssh_key}")}"
    }

    network_interface {
        subnetwork = "${google_compute_subnetwork.subnet1b.name}"
        network_ip = "10.241.2.102"
        access_config {
            nat_ip = "${google_compute_address.vm1b-ipv4.address}"
        }
    }
}

