variable "name" {
  description = "Name assigned to the VPC"
  type        = string
}

variable "cidr_block" {
  description = "IPv4 CIDR block assigned to the VPC"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.cidr_block))
    error_message = "cidr_block must be a valid IPv4 CIDR block."
  }
}

variable "enable_dns_support" {
  description = "Whether the VPC supports DNS resolution"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Whether instances receive DNS hostnames"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags assigned to the VPC"
  type        = map(string)
  default     = {}
}
