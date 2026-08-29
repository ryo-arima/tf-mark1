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
