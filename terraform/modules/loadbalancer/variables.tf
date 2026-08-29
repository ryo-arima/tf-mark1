variable "resource_prefix" {
  description = "Normalized prefix used for load balancer resource names"
  type        = string
}

variable "common_tags" {
  description = "Tags shared by every infrastructure abstraction"
  type        = map(string)
}

variable "subnet_ids" {
  description = "Subnet IDs used by the load balancer"
  type        = list(string)
}

variable "config" {
  description = "Validated load balancer abstraction parameters"
  type        = any
}
