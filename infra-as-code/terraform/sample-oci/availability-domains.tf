data "oci_identity_availability_domains" "ads" {
  # provider       = oci.HYD
  compartment_id = var.tenancy_ocid
}

