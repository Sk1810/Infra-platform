cidr_block = {
  "ap-southeast-1" : "10.11.0.0/16"
  "ap-south-1" : "10.21.0.0/16"
  "us-east-1" : "10.31.0.0/16"
  "eu-north-1" : "10.41.0.0/16"
}
public_subnets = {
  "ap-southeast-1" : ["10.11.10.0/24", "10.11.20.0/24"]
  "ap-south-1" : ["10.21.10.0/24", "10.21.20.0/24"]
  "us-east-1" : ["10.31.10.0/24", "10.31.20.0/24"]
  "eu-north-1" : ["10.41.10.0/24", "10.41.20.0/24"]
}

private_subnets = {
  "ap-southeast-1" : ["10.11.110.0/24", "10.11.120.0/24"]
  "ap-south-1" : ["10.21.110.0/24", "10.21.120.0/24"]
  "us-east-1" : ["10.31.110.0/24", "10.31.120.0/24"]
  "eu-north-1" : ["10.41.110.0/24", "10.41.120.0/24"]
}

s3_micro = "microservices"

datacenter_codes = {
  "ap-southeast-1" : "sea"
  "ap-south-1" : "in"
  "us-east-1" : "us"
  "eu-north-1" : "eu"
}

table_details = {
  "platform-facial-insights" : {
    table_name     = "platform-facial-insights"
    hash_key       = "PK"
    range_key      = "SK"
    stream_enabled = false
  },
}

sqs-name = "platform"

sqs-name-dl = "platform-dl"

repo_name = "platform"

DEFAULT_TAGS = {
  CreatedBy = "Terraform"
  Product   = "DECODE_PLATFORM"
}

cluster_name = "platform"