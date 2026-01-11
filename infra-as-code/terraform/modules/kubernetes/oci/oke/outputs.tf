# --------------------------------------------------
# OKE Outputs
# --------------------------------------------------

output "cluster_id" {
  description = "OKE Cluster OCID"
  value       = oci_containerengine_cluster.oke_cluster.id
}

output "cluster_name" {
  description = "OKE Cluster Name"
  value       = oci_containerengine_cluster.oke_cluster.name
}

output "kubernetes_version" {
  description = "Kubernetes version of the cluster"
  value       = oci_containerengine_cluster.oke_cluster.kubernetes_version
}

output "cluster_endpoint" {
  description = "Kubernetes API server endpoint"
  value       = oci_containerengine_cluster.oke_cluster.endpoints[0].public_endpoint
}

data "oci_containerengine_cluster_kube_config" "kubeconfig" {
  cluster_id = oci_containerengine_cluster.oke_cluster.id
}

output "kubeconfig" {
  value     = data.oci_containerengine_cluster_kube_config.kubeconfig
  sensitive = true
}
