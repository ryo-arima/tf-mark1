variable "datastore" {
  description = "Typed parameters for the datastore abstraction"

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
    condition     = contains(["PAY_PER_REQUEST", "PROVISIONED"], var.datastore.billing_mode)
    error_message = "datastore.billing_mode must be PAY_PER_REQUEST or PROVISIONED."
  }

  validation {
    condition     = contains(["B", "N", "S"], var.datastore.hash_key_type)
    error_message = "datastore.hash_key_type must be B, N, or S."
  }

  validation {
    condition     = var.datastore.read_capacity >= 1 && var.datastore.write_capacity >= 1
    error_message = "datastore read_capacity and write_capacity must both be at least 1."
  }
}
