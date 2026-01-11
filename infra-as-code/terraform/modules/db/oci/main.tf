############################
# OCI PostgreSQL DB System
############################

resource "oci_psql_db_system" "postgres" {
  compartment_id = var.compartment_ocid
  display_name   = "${var.environment}-postgres"

  ############################
  # PostgreSQL Version & Shape
  ############################
  db_version = var.engine_version
  shape      = var.db_instance_shape

  shape_config {
    ocpus         = var.db_ocpus
    memory_in_gbs = var.db_memory_gb
  }

  ############################
  # Storage
  ############################
  storage_details {
    is_regionally_durable = true
    availability_domain  = var.availability_domain
    iops                 = 3000
    storage_size_in_gbs  = var.storage_gb
  }

  ############################
  # Network (PRIVATE ONLY)
  ############################
  network_details {
    subnet_id = var.private_subnet_id
  }

  ############################
  # Credentials
  ############################
  credentials {
    username = var.administrator_login
    password = var.administrator_login_password
  }

  ############################
  # Instance Count (DEV)
  ############################
  instance_count = 1

  ############################
  # Tags
  ############################
  freeform_tags = {
    Name              = "${var.environment}-db"
    environment       = var.environment
    KubernetesCluster = var.environment
  }
}

############################
# Fetch DB Details
############################

data "oci_psql_db_system" "postgres" {
  db_system_id = oci_psql_db_system.postgres.id
}
