# OCI Core
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "region" {}
variable "fingerprint" {}

# Compartments
# --------------------
variable "network_compartment_ocid" {}
variable "oke_compartment_ocid" {}
variable "storage_compartment_ocid" {}
variable "database_compartment_ocid" {}

# Networking
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}

variable "vcn_cidr" {
  default = "10.0.0.0/16"
}

variable "dns_label" {
  default = "ociup"
}

# OKE
variable "cluster_name" {}
variable "kubernetes_version" {}

# Node Pool
# --------------------
#variable "node_pool_size" {}
#variable "node_shape" {}
variable "availability_domain" {}
variable "node_image_id" {}

variable "node_ocpus" {
  type        = number
  description = "OCPUs for Flex nodes"
}

variable "node_memory_in_gbs" {
  type        = number
  description = "Memory for Flex nodes"
}


variable "node_pool_size" {
  default = 3
}

variable "node_shape" {
  default = "VM.Standard.E4.Flex"
}


