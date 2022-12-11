terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.ecr_region]
    }
  }
}

data "aws_region" "current" {
  provider = aws.ecr_region
}

resource "aws_ecr_repository" "platform-repository" {
  name                 = var.STAGE == "prod" ? join("-", [lookup(var.datacenter_codes, data.aws_region.current.name), var.repo_name]) : join("-", [lookup(var.datacenter_codes, data.aws_region.current.name), var.STAGE, var.repo_name])
  image_tag_mutability = "IMMUTABLE"
  tags                 = merge(tomap({ "Name" : "decode-platform-ecr" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ecr_lifecycle_policy" "platform-repository-LC" {
  repository = aws_ecr_repository.platform-repository.name
  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 10 images",
      "selection": {
        "tagStatus": "untagged",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}