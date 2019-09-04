resource "random_id" "instance_id" {
    byte_length = 2
}

provider "google" {
    project     = "londonuk"
    region      = "${var.gcp_region}"
}
