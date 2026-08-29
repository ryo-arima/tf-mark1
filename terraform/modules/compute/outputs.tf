output "cluster_arn" {
  description = "ARN of the ECS cluster"
  value       = module.ecs.arn
}

output "cluster_name" {
  description = "Name of the ECS cluster"
  value       = module.ecs.name
}
