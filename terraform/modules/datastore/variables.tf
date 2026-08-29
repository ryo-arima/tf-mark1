variable "resource_prefix" {
  description = "Normalized prefix used for datastore resource names"
  type        = string
}

variable "common_tags" {
  description = "Tags shared by every infrastructure abstraction"
  type        = map(string)
}

variable "config" {
  description = "Validated datastore abstraction parameters"
  type        = any
}
