output "database_arn" {
  description = "ARN of the Glue catalog database"
  value       = module.glue.database_arn
}

output "database_name" {
  description = "Name of the Glue catalog database"
  value       = module.glue.database_name
}
