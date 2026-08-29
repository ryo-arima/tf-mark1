output "queue_arn" {
  description = "ARN of the jobs queue"
  value       = module.jobs_queue.arn
}

output "queue_url" {
  description = "URL of the jobs queue"
  value       = module.jobs_queue.url
}
