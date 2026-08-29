module "eventbridge" {
  source = "../../templates/services/eventbridge"

  config = {
    event_bus_name = "${var.context.resource_prefix}-${var.config.event_bus_name}"
    description    = var.config.description
    tags           = merge(var.context.common_tags, var.config.tags)
  }
}
