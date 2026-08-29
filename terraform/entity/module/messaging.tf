variable "messaging" {
  description = "Typed parameters for the messaging abstraction"

  type = object({
    queue_name                 = string
    visibility_timeout_seconds = optional(number, 30)
    message_retention_seconds  = optional(number, 345600)
    tags                       = optional(map(string), {})
  })

  validation {
    condition     = var.messaging.visibility_timeout_seconds >= 0 && var.messaging.visibility_timeout_seconds <= 43200
    error_message = "messaging.visibility_timeout_seconds must be between 0 and 43200."
  }

  validation {
    condition     = var.messaging.message_retention_seconds >= 60 && var.messaging.message_retention_seconds <= 1209600
    error_message = "messaging.message_retention_seconds must be between 60 and 1209600."
  }
}
