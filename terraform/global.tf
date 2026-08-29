terraform {
  required_version = ">= 1.6.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

variable "aws_region" {
  description = "AWS region used by MiniStack"
  type        = string
}

variable "ministack_endpoint" {
  description = "MiniStack endpoint accessed from the host"
  type        = string

  validation {
    condition     = startswith(var.ministack_endpoint, "http://") || startswith(var.ministack_endpoint, "https://")
    error_message = "ministack_endpoint must be a URL beginning with http:// or https://."
  }
}

// The default AWS provider is inherited by every local child module.
provider "aws" {
  region                      = var.aws_region
  access_key                  = "test"
  secret_key                  = "test"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_requesting_account_id  = true

  endpoints {
    acm             = var.ministack_endpoint
    apigateway      = var.ministack_endpoint
    apigatewayv2    = var.ministack_endpoint
    appsync         = var.ministack_endpoint
    athena          = var.ministack_endpoint
    bedrock         = var.ministack_endpoint
    bedrockagent    = var.ministack_endpoint
    cloudformation  = var.ministack_endpoint
    cloudfront      = var.ministack_endpoint
    cloudwatch      = var.ministack_endpoint
    codebuild       = var.ministack_endpoint
    cognitoidentity = var.ministack_endpoint
    cognitoidp      = var.ministack_endpoint
    dynamodb        = var.ministack_endpoint
    ec2             = var.ministack_endpoint
    ecr             = var.ministack_endpoint
    ecs             = var.ministack_endpoint
    efs             = var.ministack_endpoint
    elasticache     = var.ministack_endpoint
    elbv2           = var.ministack_endpoint
    emr             = var.ministack_endpoint
    events          = var.ministack_endpoint
    firehose        = var.ministack_endpoint
    glue            = var.ministack_endpoint
    iam             = var.ministack_endpoint
    kafka           = var.ministack_endpoint
    kinesis         = var.ministack_endpoint
    kms             = var.ministack_endpoint
    lambda          = var.ministack_endpoint
    logs            = var.ministack_endpoint
    rds             = var.ministack_endpoint
    route53         = var.ministack_endpoint
    s3              = var.ministack_endpoint
    s3control       = var.ministack_endpoint
    secretsmanager  = var.ministack_endpoint
    ses             = var.ministack_endpoint
    sesv2           = var.ministack_endpoint
    sns             = var.ministack_endpoint
    sqs             = var.ministack_endpoint
    ssm             = var.ministack_endpoint
    stepfunctions   = var.ministack_endpoint
    sts             = var.ministack_endpoint
    wafv2           = var.ministack_endpoint
  }
}
