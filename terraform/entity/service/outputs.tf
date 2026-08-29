output "vpc" {
  description = "Validated VPC service parameters"
  value       = var.vpc
}

output "ecs" {
  description = "Validated ECS service parameters"
  value       = var.ecs
}

output "dynamodb" {
  description = "Validated DynamoDB service parameters"
  value       = var.dynamodb
}

output "sqs" {
  description = "Validated SQS service parameters"
  value       = var.sqs
}

output "apigatewayv2" {
  description = "Validated API Gateway v2 service parameters"
  value       = var.apigatewayv2
}

output "cloudwatch_logs" {
  description = "Validated CloudWatch Logs service parameters"
  value       = var.cloudwatch_logs
}

output "ecr" {
  description = "Validated ECR service parameters"
  value       = var.ecr
}

output "eventbridge" {
  description = "Validated EventBridge service parameters"
  value       = var.eventbridge
}

output "glue" {
  description = "Validated Glue service parameters"
  value       = var.glue
}

output "kms" {
  description = "Validated KMS service parameters"
  value       = var.kms
}

output "route53" {
  description = "Validated Route 53 service parameters"
  value       = var.route53
}

output "ssm" {
  description = "Validated SSM service parameters"
  value       = var.ssm
}

output "elbv2" {
  description = "Validated Elastic Load Balancing v2 service parameters"
  value       = var.elbv2
}

output "iam" {
  description = "Validated IAM service parameters"
  value       = var.iam
}

output "codebuild" {
  description = "Validated CodeBuild service parameters"
  value       = var.codebuild
}
