variable "table_details" {
  type = map(any)
  description = "List of tables and properties" 
}

variable "stream_enabled" {
  type = bool
  description = "Flag for enabling/disabling dynamodb stream"
  default = false
}

variable "DEFAULT_TAGS" {
  type = map(any)
  description = "Default Tags for all resources"
}

variable "STAGE" {
  type = string
  description = "Stage for deployment"
}

