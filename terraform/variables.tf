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

variable "datastore" {
  description = "Datastore abstraction parameters validated by entity/module"
  type        = any
}

variable "messaging" {
  description = "Messaging abstraction parameters validated by entity/module"
  type        = any
}

variable "api" {
  description = "API abstraction parameters validated by entity/module"
  type        = any
}

variable "analytics" {
  description = "Analytics abstraction parameters validated by entity/module"
  type        = any
}

variable "configuration" {
  description = "Configuration abstraction parameters validated by entity/module"
  type        = any
}

variable "dns" {
  description = "DNS abstraction parameters validated by entity/module"
  type        = any
}

variable "event" {
  description = "Event abstraction parameters validated by entity/module"
  type        = any
}

variable "monitor" {
  description = "Monitor abstraction parameters validated by entity/module"
  type        = any
}

variable "registry" {
  description = "Registry abstraction parameters validated by entity/module"
  type        = any
}

variable "security" {
  description = "Security abstraction parameters validated by entity/module"
  type        = any
}

variable "loadbalancer" {
  description = "Load balancer abstraction parameters validated by entity/module"
  type        = any
}

variable "cicd" {
  description = "CI/CD abstraction parameters validated by entity/module"
  type        = any
}

variable "iam" {
  description = "IAM abstraction parameters validated by entity/module"
  type        = any
}
