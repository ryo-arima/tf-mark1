output "arn" {
  description = "ARN of the ECS cluster"
  value       = module.cluster.arn
}

output "name" {
  description = "Name of the ECS cluster"
  value       = module.cluster.name
}
