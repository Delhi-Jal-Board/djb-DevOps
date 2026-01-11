#
# OCI Network Resources
#  * VCN
#  * Internet Gateway
#  * NAT Gateway
#  * Route Tables
#  * Public & Private Subnets
#

# ------------------------
# VCN (VPC equivalent)
# ------------------------
resource "oci_core_vcn" "vcn" {
  cidr_block     = var.vcn_cidr
  compartment_id = var.compartment_id
  display_name   = "${var.cluster_name}-vcn"
  dns_label      = var.dns_label

  freeform_tags = {
    Name               = var.cluster_name
    KubernetesCluster  = var.cluster_name
  }
}

# ------------------------
# Internet Gateway
# ------------------------
resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "${var.cluster_name}-igw"
  enabled        = true
}

# ------------------------
# NAT Gateway (NO EIP NEEDED)
# ------------------------
resource "oci_core_nat_gateway" "nat" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "${var.cluster_name}-nat"
}

# ------------------------
# Public Route Table
# ------------------------
resource "oci_core_route_table" "public_rt" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.vcn.id

  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}

# ------------------------
# Private Route Table
# ------------------------
resource "oci_core_route_table" "private_rt" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id

  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_nat_gateway.nat.id
  }
}



# ------------------------
# Public Subnet
# ------------------------
resource "oci_core_subnet" "public_subnet" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id

  cidr_block     = var.public_subnet_cidr
  display_name   = "public-api-subnet"
  dns_label      = "public"

  route_table_id    = oci_core_route_table.public_rt.id
  security_list_ids = [oci_core_security_list.public_api_sl.id]

  prohibit_public_ip_on_vnic = false
}

# ------------------------
# Private Subnet
# ------------------------
resource "oci_core_subnet" "private_subnet" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id

  cidr_block     = var.private_subnet_cidr
  display_name   = "private-worker-subnet"
  dns_label      = "private"

  route_table_id    = oci_core_route_table.private_rt.id
  security_list_ids = [oci_core_security_list.private_worker_sl.id]

  prohibit_public_ip_on_vnic = true
}


resource "oci_core_security_list" "public_api_sl" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "public-api-sl"

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"

    tcp_options {
      min = 6443
      max = 6443
    }
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_security_list" "private_worker_sl" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id

  # Worker <-> Worker
  ingress_security_rules {
    protocol = "all"
    source   = var.private_subnet_cidr
  }

  # Control plane → kubelet
  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"

    tcp_options {
      min = 10250
      max = 10250
    }
  }

  # Control plane → nodes (API callbacks)
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 6443
      max = 6443
    }
  }

  # ICMP (node health checks)
  ingress_security_rules {
    protocol = "1"
    source   = "0.0.0.0/0"
  }

  # OUTBOUND – THIS IS CRITICAL
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}
