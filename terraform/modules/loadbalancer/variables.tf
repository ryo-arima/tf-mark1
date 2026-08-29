variable "context" {
  description = "Shared naming and tagging context"
  type = object({
    resource_prefix = string
    common_tags     = map(string)
  })
}

variable "subnet_ids" {
  description = "Subnet IDs used by the load balancer"
  type        = list(string)
}

variable "config" {
  description = "Validated load balancer abstraction parameters"
  type        = any
}
