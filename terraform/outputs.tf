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

output "api_name" {
  description = "Name of the local API Gateway v2 API"
  value       = module.infrastructure.api_name
}

output "glue_database_name" {
  description = "Name of the local Glue catalog database"
  value       = module.infrastructure.glue_database_name
}

output "ssm_parameter_name" {
  description = "Name of the local SSM parameter"
  value       = module.infrastructure.ssm_parameter_name
}

output "route53_zone_name" {
  description = "Name of the local Route 53 hosted zone"
  value       = module.infrastructure.route53_zone_name
}

output "event_bus_name" {
  description = "Name of the local EventBridge event bus"
  value       = module.infrastructure.event_bus_name
}

output "log_group_name" {
  description = "Name of the local CloudWatch log group"
  value       = module.infrastructure.log_group_name
}

output "ecr_repository_name" {
  description = "Name of the local ECR repository"
  value       = module.infrastructure.ecr_repository_name
}

output "kms_key_alias" {
  description = "Alias of the local KMS key"
  value       = module.infrastructure.kms_key_alias
}

output "load_balancer_dns_name" {
  description = "DNS name of the local application load balancer"
  value       = module.infrastructure.load_balancer_dns_name
}

output "codebuild_project_name" {
  description = "Name of the local CodeBuild project"
  value       = module.infrastructure.codebuild_project_name
}

output "iam_role_name" {
  description = "Name of the local IAM role"
  value       = module.infrastructure.iam_role_name
}
