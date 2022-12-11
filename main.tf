# SEA Resources
module "create_sea_vpc" {
  source          = "./modules/vpc"
  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  STAGE           = var.STAGE
  
  providers = {
    aws.vpc_region = aws.sea_region
  }
}

module "create_sea_s3_bucket" {
  source           = "./modules/s3"
  bucket_name      = var.s3_micro
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes
  
  providers = {
    aws.s3_region = aws.sea_region
  }
}

module "create_sea_dynamodb" {
  source        = "./modules/dynamodb"
  DEFAULT_TAGS  = var.DEFAULT_TAGS
  STAGE         = var.STAGE
  table_details = var.table_details

  providers = {
    aws.dynamo_region = aws.sea_region
  }
}

module "create_sea_sqs" {
  source           = "./modules/SQS"
  sqs-name         = var.sqs-name
  sqs-name-dl      = var.sqs-name-dl
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes
 
  providers = {
    aws.sqs_region = aws.sea_region
  }
}

# IN Resources
module "create_in_ecr" {
  source           = "./modules/ECR"
  repo_name        = var.repo_name
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes
  
  providers = {
    aws.ecr_region = aws.in_region
  }
}

module "create_in_ecs" {
  source           = "./modules/ECS"
  cluster_name        = var.cluster_name
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes
  
  providers = {
    aws.ecs_region = aws.in_region
  }
}

module "create_in_vpc" {
  source          = "./modules/vpc"
  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  STAGE           = var.STAGE
  
  providers = {
    aws.vpc_region = aws.in_region
  }
}

module "create_in_s3_bucket" {
  source           = "./modules/s3"
  bucket_name      = var.s3_micro
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes
  
  providers = {
    aws.s3_region = aws.in_region
  }
}

module "create_in_dynamodb" {
  source        = "./modules/dynamodb"
  DEFAULT_TAGS  = var.DEFAULT_TAGS
  STAGE         = var.STAGE
  table_details = var.table_details

  providers = {
    aws.dynamo_region = aws.in_region
  }
}

module "create_in_sqs" {
  source           = "./modules/SQS"
  sqs-name         = var.sqs-name
  sqs-name-dl      = var.sqs-name-dl
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes
 
  providers = {
    aws.sqs_region = aws.in_region
  }
}

# EU Resources
module "create_eu_vpc" {
  source          = "./modules/vpc"
  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  STAGE           = var.STAGE
  
  providers = {
    aws.vpc_region = aws.eu_region
  }
}

module "create_eu_s3_bucket" {
  source           = "./modules/s3"
  bucket_name      = var.s3_micro
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes
  


  providers = {
    aws.s3_region = aws.eu_region
  }
}

module "create_eu_dynamodb" {
  source        = "./modules/dynamodb"
  DEFAULT_TAGS  = var.DEFAULT_TAGS
  STAGE         = var.STAGE
  table_details = var.table_details

  providers = {
    aws.dynamo_region = aws.eu_region
  }
}

module "create_eu_sqs" {
  source           = "./modules/SQS"
  sqs-name         = var.sqs-name
  sqs-name-dl      = var.sqs-name-dl
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes
  
  providers = {
    aws.sqs_region = aws.eu_region
  }
}

# US Resources
module "create_us_vpc" {
  source          = "./modules/vpc"
  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  STAGE           = var.STAGE
  
  providers = {
    aws.vpc_region = aws.us_region
  }
}

module "create_us_s3_bucket" {
  source           = "./modules/s3"
  bucket_name      = var.s3_micro
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes
  


  providers = {
    aws.s3_region = aws.us_region
  }
}

module "create_us_dynamodb" {
  source        = "./modules/dynamodb"
  DEFAULT_TAGS  = var.DEFAULT_TAGS
  STAGE         = var.STAGE
  table_details = var.table_details

  providers = {
    aws.dynamo_region = aws.us_region
  }
}

module "create_us_sqs" {
  source           = "./modules/SQS"
  sqs-name         = var.sqs-name
  sqs-name-dl      = var.sqs-name-dl
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes
  
  providers = {
    aws.sqs_region = aws.us_region
  }
}