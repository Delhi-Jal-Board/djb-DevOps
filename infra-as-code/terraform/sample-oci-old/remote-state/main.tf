provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

resource "oci_objectstorage_bucket" "terraform_state" {
  compartment_id = var.compartment_ocid
  name           = var.bucket_name
  namespace      = var.object_storage_namespace

  versioning = "Enabled"

  freeform_tags = {
    Purpose = "terraform-remote-state"
    Project = "upyog"
  }

  lifecycle {
    prevent_destroy = true
  }
}

