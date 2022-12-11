terraform {
    backend "s3" {
        dynamodb_table = "entropik-terraform-state-lock-prod"
        bucket = "entropik-terraform-state-prod"
        key =   "terraform.tfstate"
        region = "ap-southeast-1"
        encrypt = false
    }
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }
}