output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.id
}

output "vpc_arn" {
  description = "ARN of the VPC"
  value       = module.vpc.arn
}
