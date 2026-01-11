############################
# OCI PostgreSQL Variables
############################

variable "environment" {
  description = "Environment / cluster name"
  type        = string
}

variable "compartment_ocid" {
  description = "OCI compartment OCID"
  type        = string
}

variable "availability_domain" {
  description = "Availability Domain for DB storage"
  type        = string
}

############################
# Network
############################

variable "private_subnet_id" {
  description = "Private subnet OCID for DB"
  type        = string
}

############################
# PostgreSQL Config
############################

variable "engine_version" {
  description = "PostgreSQL version"
  type        = string
  default     = "15"
}

variable "administrator_login" {
  description = "PostgreSQL admin username"
  type        = string
}

variable "administrator_login_password" {
  description = "PostgreSQL admin password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name (logical)"
  type        = string
}

############################
# Compute & Storage (DEV)
############################

variable "db_instance_shape" {
  description = "OCI PostgreSQL shape"
  type        = string
  default     = "PostgreSQL.VM.Standard.E5.Flex"
}

variable "db_ocpus" {
  description = "Number of OCPUs"
  type        = number
  default     = 1
}

variable "db_memory_gb" {
  description = "Memory in GB"
  type        = number
  default     = 16
}

variable "storage_gb" {
  description = "Storage size in GB"
  type        = number
  default     = 50
}
