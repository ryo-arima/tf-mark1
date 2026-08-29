variable "aws_region" {
  description = "AWS region used by MiniStack"
  type        = string
}

variable "ministack_endpoint" {
  description = "MiniStack endpoint accessed from the host"
  type        = string

  validation {
    condition     = startswith(var.ministack_endpoint, "http://") || startswith(var.ministack_endpoint, "https://")
    error_message = "ministack_endpoint must be a URL beginning with http:// or https://."
  }
}

variable "context" {
  description = "Shared infrastructure context validated by entity/util"
  type        = any
}

variable "network" {
  description = "Network abstraction parameters validated by entity/module"
  type        = any
}

variable "compute" {
  description = "Compute abstraction parameters validated by entity/module"
  type        = any
}

variable "storage" {
  description = "Storage abstraction parameters validated by entity/module"
  type        = any
}

variable "messaging" {
  description = "Messaging abstraction parameters validated by entity/module"
  type        = any
}
