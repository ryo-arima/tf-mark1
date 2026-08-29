output "vpc_id" {
  description = "ID of the VPC created by the network module"
  value       = module.network.vpc_id
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster created by the compute module"
  value       = module.compute.cluster_name
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table created by the datastore module"
  value       = module.datastore.table_name
}

output "sqs_queue_url" {
  description = "URL of the SQS queue created by the messaging module"
  value       = module.messaging.queue_url
}

output "api_name" {
  description = "Name of the API Gateway v2 API created by the API module"
  value       = module.api.api_name
}

output "glue_database_name" {
  description = "Name of the Glue catalog database created by the analytics module"
  value       = module.analytics.database_name
}

output "ssm_parameter_name" {
  description = "Name of the SSM parameter created by the configuration module"
  value       = module.configuration.parameter_name
}

output "route53_zone_name" {
  description = "Name of the Route 53 hosted zone created by the DNS module"
  value       = module.dns.zone_name
}

output "event_bus_name" {
  description = "Name of the EventBridge event bus created by the event module"
  value       = module.event.event_bus_name
}

output "log_group_name" {
  description = "Name of the CloudWatch log group created by the monitor module"
  value       = module.monitor.log_group_name
}

output "ecr_repository_name" {
  description = "Name of the ECR repository created by the registry module"
  value       = module.registry.repository_name
}

output "kms_key_alias" {
  description = "Alias of the KMS key created by the security module"
  value       = module.security.key_alias
}

output "load_balancer_dns_name" {
  description = "DNS name of the application load balancer"
  value       = module.loadbalancer.dns_name
}

output "codebuild_project_name" {
  description = "Name of the CodeBuild project created by the CI/CD module"
  value       = module.cicd.project_name
}

output "iam_role_name" {
  description = "Name of the IAM role created by the IAM module"
  value       = module.iam.role_name
}
