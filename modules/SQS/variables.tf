variable "sqs-name" {
  type = string
  description = "name of sqs"
}

variable "datacenter_codes" {
  type        = map(string)
  description = "Data center code values"
}

variable "sqs-name-dl" {
  type = string
  description = "name of sqs dead letter"
}

variable "DEFAULT_TAGS" {
  type = map(any)
  description = "Default Tags for all resources"
}

variable "STAGE" {
  type = string
  description = "Stage for deployment"
}