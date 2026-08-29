variable "resource_prefix" {
  description = "Normalized prefix used for CI/CD resource names"
  type        = string
}

variable "common_tags" {
  description = "Tags shared by every infrastructure abstraction"
  type        = map(string)
}

variable "service_role_arn" {
  description = "ARN of the IAM role used by CodeBuild"
  type        = string
}

variable "config" {
  description = "Validated CI/CD abstraction parameters"
  type        = any
}
