output "gcp-vm1-public-ip" {
  value = "${google_compute_address.vm1a-ipv4.address}"
}

output "gcp-vm2-public-ip" {
  value = "${google_compute_address.vm1b-ipv4.address}"
}

output "gcp-k8s1-name" {
  value = "${google_container_cluster.k8s1a.name}"
}

output "gcp-k8s1-zone" {
  value = "${google_container_cluster.k8s1a.location}"
}

output "gcp-k8s2-name" {
  value = "${google_container_cluster.k8s1b.name}"
}

output "gcp-k8s2-zone" {
  value = "${google_container_cluster.k8s1b.location}"
}