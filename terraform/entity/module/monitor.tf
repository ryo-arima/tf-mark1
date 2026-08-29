variable "monitor" {
  description = "Typed parameters for the monitor abstraction"

  type = object({
    log_group_name    = string
    retention_in_days = optional(number, 7)
    skip_destroy      = optional(bool, false)
    tags              = optional(map(string), {})
  })

  validation {
    condition = contains([
      0, 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731,
      1096, 1827, 2192, 2557, 2922, 3288, 3653,
    ], var.monitor.retention_in_days)
    error_message = "monitor.retention_in_days must be a CloudWatch Logs supported retention value."
  }
}
