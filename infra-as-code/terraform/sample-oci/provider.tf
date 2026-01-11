provider "oci" {
  tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaa2p5uw2myjiiowrtub5pcvgrwaqwnpi4fdtgy4x2r4ojrr4l672ga"
  user_ocid        = "ocid1.user.oc1..aaaaaaaandw5zdiiotcwmvrqgeef3enlh2qw3wclvvt66hwksrwmv4rlxmwq"
  private_key_path = "/home/devanshu-jain/Desktop/DJB/itprojects@nitcon.org-2026-01-08T06_19_00.925Z.pem"
  fingerprint      = "e8:03:cb:7b:db:15:97:f3:b1:f3:91:71:47:b0:4b:09"
  region           = "ap-hyderabad-1"
}

provider "oci" {
  alias            = "PHX"
  tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaa2p5uw2myjiiowrtub5pcvgrwaqwnpi4fdtgy4x2r4ojrr4l672ga"
  user_ocid        = "ocid1.user.oc1..aaaaaaaandw5zdiiotcwmvrqgeef3enlh2qw3wclvvt66hwksrwmv4rlxmwq"
  private_key_path = "/home/devanshu-jain/Desktop/DJB/itprojects@nitcon.org-2026-01-08T06_19_00.925Z.pem"
  fingerprint      = "e8:03:cb:7b:db:15:97:f3:b1:f3:91:71:47:b0:4b:09"
  region           = "us-phoenix-1"
}

provider "oci" {
  alias            = "HYD"
  tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaa2p5uw2myjiiowrtub5pcvgrwaqwnpi4fdtgy4x2r4ojrr4l672ga"
  user_ocid        = "ocid1.user.oc1..aaaaaaaandw5zdiiotcwmvrqgeef3enlh2qw3wclvvt66hwksrwmv4rlxmwq"
  private_key_path = "/home/devanshu-jain/Desktop/DJB/itprojects@nitcon.org-2026-01-08T06_19_00.925Z.pem"
  fingerprint      = "e8:03:cb:7b:db:15:97:f3:b1:f3:91:71:47:b0:4b:09"
  region           = "ap-hyderabad-1"
}