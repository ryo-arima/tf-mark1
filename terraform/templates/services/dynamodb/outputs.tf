output "table_arn" {
  description = "ARN of the locks table"
  value       = module.locks_table.arn
}

output "table_name" {
  description = "Name of the locks table"
  value       = module.locks_table.name
}
