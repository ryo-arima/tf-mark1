output "arn" {
  description = "ARN of the application load balancer"
  value       = module.elbv2.arn
}

output "dns_name" {
  description = "DNS name of the application load balancer"
  value       = module.elbv2.dns_name
}

output "listener_arn" {
  description = "ARN of the HTTP listener"
  value       = module.elbv2.listener_arn
}
