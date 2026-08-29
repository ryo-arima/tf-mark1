variable "storage" {
  description = "Typed parameters for the storage abstraction"

  type = object({
    table_name     = string
    billing_mode   = optional(string, "PAY_PER_REQUEST")
    hash_key       = optional(string, "LockID")
    hash_key_type  = optional(string, "S")
    read_capacity  = optional(number, 1)
    write_capacity = optional(number, 1)
    tags           = optional(map(string), {})
  })

  validation {
    condition     = contains(["PAY_PER_REQUEST", "PROVISIONED"], var.storage.billing_mode)
    error_message = "storage.billing_mode must be PAY_PER_REQUEST or PROVISIONED."
  }

  validation {
    condition     = contains(["B", "N", "S"], var.storage.hash_key_type)
    error_message = "storage.hash_key_type must be B, N, or S."
  }

  validation {
    condition     = var.storage.read_capacity >= 1 && var.storage.write_capacity >= 1
    error_message = "storage read_capacity and write_capacity must both be at least 1."
  }
}
