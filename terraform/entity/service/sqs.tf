variable "sqs" {
  description = "Typed parameters passed to the SQS service module"

  type = object({
    queue_name                 = string
    visibility_timeout_seconds = number
    message_retention_seconds  = number
    tags                       = map(string)
  })

  default  = null
  nullable = true

  validation {
    condition     = var.sqs == null ? true : var.sqs.visibility_timeout_seconds >= 0 && var.sqs.visibility_timeout_seconds <= 43200
    error_message = "sqs.visibility_timeout_seconds must be between 0 and 43200."
  }

  validation {
    condition     = var.sqs == null ? true : var.sqs.message_retention_seconds >= 60 && var.sqs.message_retention_seconds <= 1209600
    error_message = "sqs.message_retention_seconds must be between 60 and 1209600."
  }
}
