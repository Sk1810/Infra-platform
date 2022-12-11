terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.sqs_region]
    }
  }
}

data "aws_region" "current" {
  provider = aws.sqs_region
}

resource "aws_sqs_queue" "platform_queue" { 
  name                      = join("-", [lookup(var.datacenter_codes, data.aws_region.current.name), var.STAGE, var.sqs-name])
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  tags                      = merge(tomap({ "Name" : "decode-platform-sqs" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_sqs_queue" "platform_queue_deadletter" {
  name = join("-", [lookup(var.datacenter_codes, data.aws_region.current.name), var.STAGE, var.sqs-name-dl])
  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.platform_queue.arn]
  })
  tags = merge(tomap({ "Name" : "decode-platform-sqs-dl" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}