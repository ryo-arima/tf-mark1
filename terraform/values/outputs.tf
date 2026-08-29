output "vpc_id" {
  description = "ID of the VPC created by the network module"
  value       = module.network.vpc_id
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster created by the compute module"
  value       = module.compute.cluster_name
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table created by the storage module"
  value       = module.storage.table_name
}

output "sqs_queue_url" {
  description = "URL of the SQS queue created by the messaging module"
  value       = module.messaging.queue_url
}
