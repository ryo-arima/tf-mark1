module "eventbridge" {
  source = "../../templates/services/eventbridge"

  providers = {
    aws = aws
  }

  config = {
    event_bus_name = "${var.resource_prefix}-${var.config.event_bus_name}"
    description    = var.config.description
    tags           = merge(var.common_tags, var.config.tags)
  }
}
