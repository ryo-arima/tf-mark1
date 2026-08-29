output "key_alias" {
  description = "Alias of the KMS key"
  value       = module.kms.alias_name
}

output "key_arn" {
  description = "ARN of the KMS key"
  value       = module.kms.key_arn
}

output "key_id" {
  description = "ID of the KMS key"
  value       = module.kms.key_id
}
