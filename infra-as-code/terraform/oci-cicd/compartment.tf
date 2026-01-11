resource "oci_identity_compartment" "create-compartment" {
  # Required
  # provider       = oci.PHX
  compartment_id = var.tenancy_ocid
  description    = "Compartment for Upyog Dev."
  name           = "upyog_jenkins"
}