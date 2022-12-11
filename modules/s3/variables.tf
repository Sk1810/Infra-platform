
variable "datacenter_codes" {
  type        = map(string)
  description = "Data center code values"
}

variable "bucket_name" {
  type        = string
  description = "Bucket name suffix"
}

variable "DEFAULT_TAGS" {
  type = map(any)
  description = "Default Tags for all resources"
}

variable "STAGE" {
  type = string
  description = "Stage for deployment"
}
