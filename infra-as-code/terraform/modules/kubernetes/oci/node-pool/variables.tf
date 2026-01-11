variable "compartment_id" {}
variable "cluster_id" {}
variable "node_pool_name" {}
variable "kubernetes_version" {}
variable "node_shape" {}
variable "node_pool_size" {}
variable "availability_domain" {}
variable "private_subnet_id" {}
variable "node_image_id" {}

variable "node_ocpus" {
  type = number
}

variable "node_memory_in_gbs" {
  type = number
}
