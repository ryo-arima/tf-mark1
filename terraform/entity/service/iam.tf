variable "iam" {
  description = "Typed parameters passed to the IAM service module"

  type = object({
    role_name          = string
    description        = string
    assume_role_policy = string
    tags               = map(string)
  })

  default  = null
  nullable = true

  validation {
    condition     = var.iam == null ? true : can(jsondecode(var.iam.assume_role_policy))
    error_message = "iam.assume_role_policy must be valid JSON."
  }
}
