output "node_pool_id" {
  description = "OCID of the OKE node pool"
  value       = oci_containerengine_node_pool.node_pool.id
}

output "node_pool_name" {
  description = "Name of the OKE node pool"
  value       = oci_containerengine_node_pool.node_pool.name
}

#output "node_pool_state" {
#  description = "Lifecycle state of the OKE node pool"
#  value       = oci_containerengine_node_pool.node_pool.lifecycle_state
#}
