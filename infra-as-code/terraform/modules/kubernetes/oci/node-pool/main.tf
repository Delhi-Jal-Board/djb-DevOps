data "oci_containerengine_node_pool_option" "options" {
  node_pool_option_id = "all"
}

locals {
  oracle_linux_oke_image_id = element([
    for s in data.oci_containerengine_node_pool_option.options.sources :
    s.image_id
    if (
      s.source_type == "IMAGE" &&
      can(regex("^Oracle-Linux", s.source_name)) &&
      can(regex("1\\.32", s.source_name)) &&        # Kubernetes version
      !can(regex("ARM|Ampere", s.source_name))      # ❗ EXCLUDE ARM images
    )
  ], 0)
}

resource "oci_containerengine_node_pool" "node_pool" {
  compartment_id     = var.compartment_id
  cluster_id         = var.cluster_id
  name               = var.node_pool_name
  kubernetes_version = var.kubernetes_version
  node_shape         = var.node_shape

  node_config_details {
    size = var.node_pool_size

    placement_configs {
      availability_domain = var.availability_domain
      subnet_id           = var.private_subnet_id
    }
  }

  node_shape_config {
    ocpus         = var.node_ocpus
    memory_in_gbs = var.node_memory_in_gbs
  }

  node_source_details {
    source_type = "IMAGE"
    image_id    = var.node_image_id
  }

  initial_node_labels {
    key   = "node-role.kubernetes.io/worker"
    value = "true"
  }
}
