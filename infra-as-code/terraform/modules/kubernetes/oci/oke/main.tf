# --------------------------------------------------
# OKE Cluster (OCI Managed Kubernetes Control Plane)
# --------------------------------------------------

resource "oci_containerengine_cluster" "oke_cluster" {
  compartment_id     = var.compartment_id
  name               = var.cluster_name
  kubernetes_version = var.kubernetes_version
  vcn_id             = var.vcn_id

  # Kubernetes API endpoint
  endpoint_config {
    is_public_ip_enabled = true
    subnet_id     = var.public_subnet_id
  }

  # OCI Load Balancer integration
  options {
    service_lb_subnet_ids = [var.service_lb_subnet_id]

    add_ons {
      is_kubernetes_dashboard_enabled = false
      is_tiller_enabled               = false
    }
  }

  freeform_tags = {
    KubernetesCluster = var.cluster_name
  }
}
