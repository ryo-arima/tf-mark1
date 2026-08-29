output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.id
}

output "vpc_arn" {
  description = "ARN of the VPC"
  value       = module.vpc.arn
}

output "subnet_ids" {
  description = "IDs of the VPC subnets"
  value       = module.vpc.subnet_ids
}
