terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.s3_region]
    }
  }
}

data "aws_region" "current" {
  provider = aws.s3_region
}

resource "aws_s3_bucket" "s3_bucket" {
  provider = aws.s3_region
  bucket   = join(".", [lookup(var.datacenter_codes, data.aws_region.current.name), var.bucket_name])
  tags     = merge(tomap({ "Name" : join("-", ["decode-platform", lookup(var.datacenter_codes, data.aws_region.current.name), "bucket"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  provider = aws.s3_region
  bucket   = aws_s3_bucket.s3_bucket.id
  acl      = "private"
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  provider                = aws.s3_region
  bucket                  = aws_s3_bucket.s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}