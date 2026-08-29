variable "context" {
  description = "Shared naming and tagging context"
  type = object({
    resource_prefix = string
    common_tags     = map(string)
  })
}

variable "config" {
  description = "Validated configuration abstraction parameters"
  type        = any
}
