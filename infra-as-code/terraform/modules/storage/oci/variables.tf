variable "compartment_id" {
  description = "Compartment where block volumes will be created"
  type        = string
}

variable "availability_domain" {
  description = "Availability Domain for block volumes"
  type        = string
}

variable "environment" {
  description = "Environment / Cluster name"
  type        = string
}

variable "component" {
  description = "Component name (kafka, es-data, zookeeper, etc.)"
  type        = string
}

variable "disk_prefix" {
  description = "Volume name prefix"
  type        = string
}

variable "disk_size_gb" {
  description = "Block volume size in GB"
  type        = number
}

variable "storage_count" {
  description = "Number of block volumes to create"
  type        = number
}

variable "vpus_per_gb" {
  description = "OCI volume performance (10=Balanced, 20/30=High)"
  type        = number
  default     = 10
}
