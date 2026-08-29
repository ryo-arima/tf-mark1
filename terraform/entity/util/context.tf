variable "context" {
  description = "Shared context used by every infrastructure abstraction"

  type = object({
    project_name = string
    common_tags  = optional(map(string), {})
  })

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-]{1,48}[a-z0-9]$", var.context.project_name))
    error_message = "context.project_name must contain 3 to 50 lowercase alphanumeric characters or hyphens."
  }
}
