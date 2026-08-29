variable "eventbridge" {
  description = "Typed parameters passed to the EventBridge service module"

  type = object({
    event_bus_name = string
    description    = string
    tags           = map(string)
  })

  default  = null
  nullable = true
}
