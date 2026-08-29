output "queue_arn" {
  description = "ARN of the SQS queue"
  value       = module.sqs.queue_arn
}

output "queue_url" {
  description = "URL of the SQS queue"
  value       = module.sqs.queue_url
}
