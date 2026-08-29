output "id" {
  description = "ID of the VPC"
  value       = module.vpc.id
}

output "arn" {
  description = "ARN of the VPC"
  value       = module.vpc.arn
}
