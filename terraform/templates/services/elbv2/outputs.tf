output "arn" {
  description = "ARN of the application load balancer"
  value       = aws_lb.this.arn
}

output "dns_name" {
  description = "DNS name of the application load balancer"
  value       = aws_lb.this.dns_name
}

output "listener_arn" {
  description = "ARN of the HTTP listener"
  value       = aws_lb_listener.http.arn
}
