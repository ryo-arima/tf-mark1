variable "context" {
  description = "Shared infrastructure context"
  type        = any
}

variable "network" {
  description = "Network abstraction parameters"
  type        = any
}

variable "compute" {
  description = "Compute abstraction parameters"
  type        = any
}

variable "storage" {
  description = "Storage abstraction parameters"
  type        = any
}

variable "messaging" {
  description = "Messaging abstraction parameters"
  type        = any
}
