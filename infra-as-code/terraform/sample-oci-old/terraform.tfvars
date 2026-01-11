# Authentication (provider only)
tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaa2p5uw2myjiiowrtub5pcvgrwaqwnpi4fdtgy4x2r4ojrr4l672ga"
user_ocid        = "ocid1.user.oc1..aaaaaaaandw5zdiiotcwmvrqgeef3enlh2qw3wclvvt66hwksrwmv4rlxmwq"
fingerprint      = "fe:4f:b7:6e:2a:5f:b2:5f:68:f2:2c:46:6f:10:0a:00"
private_key_path = "/home/devanshu-jain/Desktop/DJB/itprojects@nitcon.org-2025-12-20T09_25_42.312Z.pem"
region           = "ap-hyderabad-1"
#node_image_id    = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaajhfyidw3edtue2qdchxybkxq23jzq2xo5sbzbykc4smxsshhaqea"


# RESOURCE SCOPE
network_compartment_ocid  = "ocid1.compartment.oc1..aaaaaaaanvaa4ygjpgmcjlmnw2tmhmase5gpfkkcmhszznwym7jxfjutaknq"
oke_compartment_ocid      = "ocid1.compartment.oc1..aaaaaaaaobhtfarb3qbhuef7fqgqt5od76w4qbvha77hucw4xh25vkr7xclq"
storage_compartment_ocid  = "ocid1.compartment.oc1..aaaaaaaa6c4rcxfbi5xd4pdroqedj2wmtcmorbbspqheg4wb4awuambwte6q"
database_compartment_ocid = "ocid1.compartment.oc1..aaaaaaaa4kyirmid6uxpburwhrf7pqe2pwr7gtearymwa4bwmruoq6nq5hsq"

# Infra
cluster_name        = "oci-test"
kubernetes_version  = "v1.32.1"
vcn_cidr            = "10.0.0.0/16"
dns_label           = "ocitest"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"

# Node Pool
# --------------------
node_pool_size     = 3
node_shape         = "VM.Standard.E4.Flex"
node_ocpus         = 2
node_memory_in_gbs = 16
node_image_id      = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaa3qculpnh55rputgxkrwwol3angnvjjjfob352e72pxs3sz4np4rq"

availability_domain = "HfTn:AP-HYDERABAD-1-AD-1"