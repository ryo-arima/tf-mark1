output "id" {
  description = "ID of the VPC"
  value       = aws_vpc.this.id
}

output "arn" {
  description = "ARN of the VPC"
  value       = aws_vpc.this.arn
}

output "subnet_ids" {
  description = "IDs of the VPC subnets"
  value       = [for name in sort(keys(aws_subnet.this)) : aws_subnet.this[name].id]
}
