variable "ssm" {
  description = "Typed parameters passed to the SSM service module"

  type = object({
    parameter_name = string
    parameter_type = string
    value          = string
    description    = string
    tags           = map(string)
  })

  default  = null
  nullable = true

  validation {
    condition     = var.ssm == null ? true : contains(["String", "StringList", "SecureString"], var.ssm.parameter_type)
    error_message = "ssm.parameter_type must be String, StringList, or SecureString."
  }
}
