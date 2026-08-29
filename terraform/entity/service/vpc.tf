variable "vpc" {
  description = "Typed parameters passed to the VPC service module"

  type = object({
    name                 = string
    cidr_block           = string
    enable_dns_support   = bool
    enable_dns_hostnames = bool
    subnets = list(object({
      name              = string
      cidr_block        = string
      availability_zone = string
    }))
    tags = map(string)
  })

  default  = null
  nullable = true

  validation {
    condition     = var.vpc == null ? true : can(cidrnetmask(var.vpc.cidr_block))
    error_message = "vpc.cidr_block must be a valid IPv4 CIDR block."
  }

  validation {
    condition     = var.vpc == null ? true : alltrue([for subnet in var.vpc.subnets : can(cidrnetmask(subnet.cidr_block))])
    error_message = "Every vpc subnet must use a valid IPv4 CIDR block."
  }
}
