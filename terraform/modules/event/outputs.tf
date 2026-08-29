output "event_bus_arn" {
  description = "ARN of the EventBridge event bus"
  value       = module.eventbridge.event_bus_arn
}

output "event_bus_name" {
  description = "Name of the EventBridge event bus"
  value       = module.eventbridge.event_bus_name
}
