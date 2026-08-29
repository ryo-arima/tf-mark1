output "id" {
  description = "ID of the VPC"
  value       = aws_vpc.this.id
}

output "arn" {
  description = "ARN of the VPC"
  value       = aws_vpc.this.arn
}
