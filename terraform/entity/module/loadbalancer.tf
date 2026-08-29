variable "loadbalancer" {
  description = "Typed parameters for the load balancer abstraction"

  type = object({
    name                       = string
    internal                   = optional(bool, true)
    listener_port              = optional(number, 80)
    idle_timeout               = optional(number, 60)
    enable_deletion_protection = optional(bool, false)
    tags                       = optional(map(string), {})
  })

  validation {
    condition     = var.loadbalancer.listener_port >= 1 && var.loadbalancer.listener_port <= 65535
    error_message = "loadbalancer.listener_port must be between 1 and 65535."
  }

  validation {
    condition     = var.loadbalancer.idle_timeout >= 1 && var.loadbalancer.idle_timeout <= 4000
    error_message = "loadbalancer.idle_timeout must be between 1 and 4000."
  }
}
