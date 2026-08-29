variable "dns" {
  description = "Typed parameters for the DNS abstraction"

  type = object({
    zone_name     = string
    comment       = optional(string, "Managed by Terraform")
    force_destroy = optional(bool, true)
    tags          = optional(map(string), {})
  })

  validation {
    condition     = length(trimspace(var.dns.zone_name)) > 0
    error_message = "dns.zone_name must not be empty."
  }
}
