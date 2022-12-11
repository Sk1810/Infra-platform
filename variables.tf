variable "cidr_block" {
  type = map(string)
  description = "CIDR Block for vpc"
}

variable "public_subnets" {
  type = map(list(string))
  description = "List of public subnet cidrs"
}

variable "private_subnets" {
  type = map(list(string))
  description = "List of private subnet cidrs"
}

variable "s3_micro" {
  type = string
  description = "Media Domain Name"
}

variable "datacenter_codes" {
  type = map(string)
  description = "Data center code values"
}

variable "table_details" {
  type = map(any)
  description = "DDB Tables details"
}

variable "sqs-name" {
  type = string
  description = "name of sqs"
}

variable "sqs-name-dl" {
  type = string
  description = "name of sqs dead letter"
}

variable "repo_name" {
  type        = string
  description = "Repo name suffix"
}

variable "DEFAULT_TAGS" {
  type = map(any)
  description = "Default Tags for all resources"
}

variable "STAGE" {
  type = string
  description = "Stage for deployment"
}

variable "cluster_name" {
  type        = string
  description = "Cluster name suffix"
}