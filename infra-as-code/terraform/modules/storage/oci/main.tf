# OCI Block Volumes (equivalent of AWS EBS)

resource "oci_core_volume" "block_volume" {
  count = var.storage_count

  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain

  display_name = "${var.disk_prefix}-${count.index}"
  size_in_gbs  = var.disk_size_gb

  # Performance tier (OCI equivalent of gp2/gp3/io1)
  vpus_per_gb = var.vpus_per_gb

  freeform_tags = {
    Name               = "${var.disk_prefix}-${count.index}"
    KubernetesCluster  = var.environment
    Component          = var.component
  }
}
