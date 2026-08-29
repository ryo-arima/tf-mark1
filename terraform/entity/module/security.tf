variable "security" {
  description = "Typed parameters for the security abstraction"

  type = object({
    key_alias               = string
    key_description         = optional(string, "Local infrastructure encryption key")
    enable_key_rotation     = optional(bool, true)
    deletion_window_in_days = optional(number, 7)
    tags                    = optional(map(string), {})
  })

  validation {
    condition     = var.security.deletion_window_in_days >= 7 && var.security.deletion_window_in_days <= 30
    error_message = "security.deletion_window_in_days must be between 7 and 30."
  }
}
