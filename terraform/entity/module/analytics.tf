variable "analytics" {
  description = "Typed parameters for the analytics abstraction"

  type = object({
    database_name = string
    description   = optional(string, "")
    tags          = optional(map(string), {})
  })
}
