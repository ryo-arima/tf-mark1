variable "network" {
  description = "Typed parameters for the network abstraction"

  type = object({
    name                 = string
    cidr_block           = string
    enable_dns_support   = optional(bool, true)
    enable_dns_hostnames = optional(bool, true)
    tags                 = optional(map(string), {})
  })

  validation {
    condition     = can(cidrnetmask(var.network.cidr_block))
    error_message = "network.cidr_block must be a valid IPv4 CIDR block."
  }
}
