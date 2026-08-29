variable "name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "billing_mode" {
  description = "Billing mode for the DynamoDB table"
  type        = string
  default     = "PAY_PER_REQUEST"

  validation {
    condition     = contains(["PAY_PER_REQUEST", "PROVISIONED"], var.billing_mode)
    error_message = "billing_mode must be PAY_PER_REQUEST or PROVISIONED."
  }
}

variable "hash_key" {
  description = "Name of the DynamoDB partition key"
  type        = string
}

variable "hash_key_type" {
  description = "Scalar type of the DynamoDB partition key"
  type        = string
  default     = "S"

  validation {
    condition     = contains(["B", "N", "S"], var.hash_key_type)
    error_message = "hash_key_type must be B, N, or S."
  }
}

variable "read_capacity" {
  description = "Read capacity used when billing_mode is PROVISIONED"
  type        = number
  default     = 1

  validation {
    condition     = var.read_capacity >= 1
    error_message = "read_capacity must be at least 1."
  }
}

variable "write_capacity" {
  description = "Write capacity used when billing_mode is PROVISIONED"
  type        = number
  default     = 1

  validation {
    condition     = var.write_capacity >= 1
    error_message = "write_capacity must be at least 1."
  }
}

variable "tags" {
  description = "Tags assigned to the DynamoDB table"
  type        = map(string)
  default     = {}
}
