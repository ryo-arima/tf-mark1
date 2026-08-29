variable "configuration" {
  description = "Typed parameters for the configuration abstraction"

  type = object({
    parameter_name = string
    parameter_type = optional(string, "String")
    value          = string
    description    = optional(string, "")
    tags           = optional(map(string), {})
  })

  validation {
    condition     = contains(["String", "StringList", "SecureString"], var.configuration.parameter_type)
    error_message = "configuration.parameter_type must be String, StringList, or SecureString."
  }
}
