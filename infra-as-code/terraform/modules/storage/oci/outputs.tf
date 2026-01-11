output "volume_ids" {
  description = "OCIDs of created block volumes"
  value       = oci_core_volume.block_volume[*].id
}

output "volume_names" {
  description = "Names of created block volumes"
  value       = oci_core_volume.block_volume[*].display_name
}
