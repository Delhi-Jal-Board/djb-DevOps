module "network" {
  source = "../modules/kubernetes/oci/network"

  compartment_id      = var.network_compartment_ocid
  cluster_name        = var.cluster_name
  vcn_cidr            = var.vcn_cidr
  dns_label           = var.dns_label
  availability_domain = var.availability_domain

  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "oke" {
  source               = "../modules/kubernetes/oci/oke"
  compartment_id       = var.oke_compartment_ocid
  cluster_name         = var.cluster_name
  kubernetes_version   = var.kubernetes_version
  vcn_id               = module.network.vcn_id
  public_subnet_id     = module.network.public_subnet_id
  service_lb_subnet_id = module.network.service_lb_subnet_id
}

module "node_pool" {
  source = "../modules/kubernetes/oci/node-pool"

  compartment_id = var.oke_compartment_ocid
  cluster_id     = module.oke.cluster_id

  node_pool_name     = "${var.cluster_name}-np"
  kubernetes_version = var.kubernetes_version

  node_shape     = var.node_shape
  node_pool_size = var.node_pool_size

  availability_domain = var.availability_domain
  private_subnet_id   = module.network.private_subnet_id
  node_image_id       = var.node_image_id
  #is_flex_shape      = true
  node_ocpus         = 2
  node_memory_in_gbs = 16
}


module "es_master" {
  source = "../modules/storage/oci"

  compartment_id      = var.storage_compartment_ocid
  availability_domain = var.availability_domain

  storage_count = 3
  environment   = var.cluster_name
  component     = "es-master"
  disk_prefix   = "es-master"

  disk_size_gb = 50
  vpus_per_gb  = 20 # gp2 equivalent (balanced)
}

module "es_data_v1" {
  source = "../modules/storage/oci"

  compartment_id      = var.storage_compartment_ocid
  availability_domain = var.availability_domain

  storage_count = 3
  environment   = var.cluster_name
  component     = "es-data-v1"
  disk_prefix   = "es-data-v1"

  disk_size_gb = 50
  vpus_per_gb  = 20 # higher performance for ES data
}

module "kafka" {
  source = "../modules/storage/oci"

  compartment_id      = var.storage_compartment_ocid
  availability_domain = var.availability_domain

  storage_count = 3
  environment   = var.cluster_name
  component     = "kafka"
  disk_prefix   = "kafka"

  disk_size_gb = 50
  vpus_per_gb  = 20
}
