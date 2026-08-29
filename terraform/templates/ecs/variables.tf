variable "name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "tags" {
  description = "Tags assigned to the ECS cluster"
  type        = map(string)
  default     = {}
}
