variable "resource_prefix" {
  description = "Normalized prefix used for IAM resource names"
  type        = string
}

variable "common_tags" {
  description = "Tags shared by every infrastructure abstraction"
  type        = map(string)
}

variable "config" {
  description = "Validated IAM abstraction parameters"
  type        = any
}
