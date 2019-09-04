variable "gcp_region" {
    default = "europe-north1"
    type = "string"
}
variable "gcp_vms_size" {
    default = "f1-micro"
    type = "string"
}
variable "gcp_k8s_worker_count" {
    default = "1"
    type = "string"
}
variable "gcp_k8s_worker_count_max" {
    default = "10"
    type = "string"
}
variable "gcp_k8s_worker_size" {
    default = "n1-standard-1"
    type = "string" 
}
