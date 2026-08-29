variable "iam" {
  description = "Typed parameters for the IAM abstraction"

  type = object({
    role_name       = string
    description     = optional(string, "")
    trusted_service = string
    tags            = optional(map(string), {})
  })

  validation {
    condition     = length(trimspace(var.iam.role_name)) > 0
    error_message = "iam.role_name must not be empty."
  }

  validation {
    condition     = can(regex("^[a-z0-9-]+[.]amazonaws[.]com$", var.iam.trusted_service))
    error_message = "iam.trusted_service must be an AWS service principal."
  }
}
