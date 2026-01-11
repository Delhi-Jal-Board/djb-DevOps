data "oci_containerengine_cluster_kube_config" "oke_kube_config" {
  #Required
  cluster_id = module.oke.cluster_id

  #Optional
  #endpoint is optional, it defaults to public_endpoint if not specified
#   endpoint = module.oke.cluster_endpoints.PRIVATE_ENDPOINT # or "PRIVATE_ENDPOINT" or "LEGACY_KUBECONFIG_ENDPOINT"
}

output "kubeconfig" {
  value     = data.oci_containerengine_cluster_kube_config.oke_kube_config.content
  sensitive = true
}

# Save the kubeconfig to a file
resource "local_file" "kubeconfig_file" {
  content  = data.oci_containerengine_cluster_kube_config.oke_kube_config.content
  filename = "${path.module}/kubeconfig_hyd"
}