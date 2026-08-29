variable "network" {
  description = "Typed parameters for the network abstraction"

  type = object({
    name                 = string
    cidr_block           = string
    enable_dns_support   = optional(bool, true)
    enable_dns_hostnames = optional(bool, true)
    subnets = optional(list(object({
      name              = string
      cidr_block        = string
      availability_zone = string
    })), [])
    tags = optional(map(string), {})
  })

  validation {
    condition     = can(cidrnetmask(var.network.cidr_block))
    error_message = "network.cidr_block must be a valid IPv4 CIDR block."
  }

  validation {
    condition     = alltrue([for subnet in var.network.subnets : can(cidrnetmask(subnet.cidr_block))])
    error_message = "Every network subnet must use a valid IPv4 CIDR block."
  }

  validation {
    condition     = length(distinct([for subnet in var.network.subnets : subnet.name])) == length(var.network.subnets)
    error_message = "Every network subnet must have a unique name."
  }
}
