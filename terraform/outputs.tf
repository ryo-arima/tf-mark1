output "ministack_endpoint" {
  description = "MiniStack API endpoint"
  value       = var.ministack_endpoint
}

output "sqs_queue_url" {
  description = "URL of the local SQS queue"
  value       = module.infrastructure.sqs_queue_url
}

output "dynamodb_table_name" {
  description = "Name of the local DynamoDB table"
  value       = module.infrastructure.dynamodb_table_name
}

output "vpc_id" {
  description = "ID of the local VPC"
  value       = module.infrastructure.vpc_id
}

output "ecs_cluster_name" {
  description = "Name of the local ECS cluster"
  value       = module.infrastructure.ecs_cluster_name
}
