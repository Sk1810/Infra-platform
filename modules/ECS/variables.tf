variable "cluster_name" {
  type        = string
  description = "Cluster name suffix"
}

variable "datacenter_codes" {
  type        = map(string)
  description = "Data center code values"
}

variable "DEFAULT_TAGS" {
  type = map(any)
  description = "Default Tags for all resources"
}

variable "STAGE" {
  type = string
  description = "Stage for deployment"
}