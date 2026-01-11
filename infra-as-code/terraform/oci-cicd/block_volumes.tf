resource "oci_core_volume" "kaniko-cache" {
  #availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  availability_domain = var.availability_domain
  compartment_id      = oci_identity_compartment.create-compartment.id
  display_name        = "es-master"
  count = 1
  size_in_gbs = "50"
}

resource "oci_core_volume" "jenkins-home" {
  #availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  availability_domain = var.availability_domain
  compartment_id      = oci_identity_compartment.create-compartment.id
  display_name        = "es-data-v1"
  count = 1
  size_in_gbs = "50"
}