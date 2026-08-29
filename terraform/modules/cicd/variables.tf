variable "context" {
  description = "Shared naming and tagging context"
  type = object({
    resource_prefix = string
    common_tags     = map(string)
  })
}

variable "service_role_arn" {
  description = "ARN of the IAM role used by CodeBuild"
  type        = string
}

variable "config" {
  description = "Validated CI/CD abstraction parameters"
  type        = any
}
