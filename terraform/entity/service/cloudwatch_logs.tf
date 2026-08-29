variable "cloudwatch_logs" {
  description = "Typed parameters passed to the CloudWatch Logs service module"

  type = object({
    log_group_name    = string
    retention_in_days = number
    skip_destroy      = bool
    tags              = map(string)
  })

  default  = null
  nullable = true

  validation {
    condition = var.cloudwatch_logs == null ? true : contains([
      0, 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731,
      1096, 1827, 2192, 2557, 2922, 3288, 3653,
    ], var.cloudwatch_logs.retention_in_days)
    error_message = "cloudwatch_logs.retention_in_days must be a supported retention value."
  }
}
