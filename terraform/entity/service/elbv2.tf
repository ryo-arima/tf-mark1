variable "elbv2" {
  description = "Typed parameters passed to the Elastic Load Balancing v2 service module"

  type = object({
    name                       = string
    internal                   = bool
    subnet_ids                 = list(string)
    listener_port              = number
    idle_timeout               = number
    enable_deletion_protection = bool
    tags                       = map(string)
  })

  default  = null
  nullable = true

  validation {
    condition     = var.elbv2 == null ? true : length(var.elbv2.subnet_ids) >= 2
    error_message = "elbv2.subnet_ids must contain at least two subnets."
  }

  validation {
    condition     = var.elbv2 == null ? true : var.elbv2.listener_port >= 1 && var.elbv2.listener_port <= 65535
    error_message = "elbv2.listener_port must be between 1 and 65535."
  }
}
