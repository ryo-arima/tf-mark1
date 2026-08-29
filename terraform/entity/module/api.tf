variable "api" {
  description = "Typed parameters for the API abstraction"

  type = object({
    api_name      = string
    protocol_type = optional(string, "HTTP")
    description   = optional(string, "")
    tags          = optional(map(string), {})
  })

  validation {
    condition     = contains(["HTTP", "WEBSOCKET"], var.api.protocol_type)
    error_message = "api.protocol_type must be HTTP or WEBSOCKET."
  }
}
