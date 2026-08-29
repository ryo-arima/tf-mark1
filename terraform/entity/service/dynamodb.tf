variable "dynamodb" {
  description = "Typed parameters passed to the DynamoDB service module"

  type = object({
    table_name     = string
    billing_mode   = string
    hash_key       = string
    hash_key_type  = string
    read_capacity  = number
    write_capacity = number
    tags           = map(string)
  })

  default  = null
  nullable = true

  validation {
    condition     = var.dynamodb == null ? true : contains(["PAY_PER_REQUEST", "PROVISIONED"], var.dynamodb.billing_mode)
    error_message = "dynamodb.billing_mode must be PAY_PER_REQUEST or PROVISIONED."
  }

  validation {
    condition     = var.dynamodb == null ? true : contains(["B", "N", "S"], var.dynamodb.hash_key_type)
    error_message = "dynamodb.hash_key_type must be B, N, or S."
  }

  validation {
    condition     = var.dynamodb == null ? true : var.dynamodb.read_capacity >= 1 && var.dynamodb.write_capacity >= 1
    error_message = "dynamodb read_capacity and write_capacity must both be at least 1."
  }
}
