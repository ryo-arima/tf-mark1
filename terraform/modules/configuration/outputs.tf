output "parameter_arn" {
  description = "ARN of the SSM parameter"
  value       = module.ssm.parameter_arn
}

output "parameter_name" {
  description = "Name of the SSM parameter"
  value       = module.ssm.parameter_name
}
