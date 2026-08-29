variable "event" {
  description = "Typed parameters for the event abstraction"

  type = object({
    event_bus_name = string
    description    = optional(string, "")
    tags           = optional(map(string), {})
  })
}
