terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.ecs_region]
    }
  }
}

data "aws_region" "current" {
  provider = aws.ecs_region
}

resource "aws_ecs_cluster" "platform-repository" {
  name = var.STAGE == "prod" ? join("-", [lookup(var.datacenter_codes, data.aws_region.current.name), var.cluster_name]) : join("-", [lookup(var.datacenter_codes, data.aws_region.current.name), var.STAGE, var.cluster_name])
  tags = merge(tomap({ "Name" : "decode-platform-cluster" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}  