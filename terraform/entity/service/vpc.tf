variable "vpc" {
  description = "Typed parameters passed to the VPC service module"

  type = object({
    name                 = string
    cidr_block           = string
    enable_dns_support   = bool
    enable_dns_hostnames = bool
    tags                 = map(string)
  })

  default  = null
  nullable = true

  validation {
    condition     = var.vpc == null ? true : can(cidrnetmask(var.vpc.cidr_block))
    error_message = "vpc.cidr_block must be a valid IPv4 CIDR block."
  }
}
