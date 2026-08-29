variable "kms" {
  description = "Typed parameters passed to the KMS service module"

  type = object({
    alias_name              = string
    description             = string
    enable_key_rotation     = bool
    deletion_window_in_days = number
    tags                    = map(string)
  })

  default  = null
  nullable = true

  validation {
    condition     = var.kms == null ? true : startswith(var.kms.alias_name, "alias/")
    error_message = "kms.alias_name must begin with alias/."
  }

  validation {
    condition     = var.kms == null ? true : var.kms.deletion_window_in_days >= 7 && var.kms.deletion_window_in_days <= 30
    error_message = "kms.deletion_window_in_days must be between 7 and 30."
  }
}
