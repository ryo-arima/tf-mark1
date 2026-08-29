module "service_entity" {
  source = "../../../entity/service"

  eventbridge = var.config
}

resource "aws_cloudwatch_event_bus" "this" {
  name        = module.service_entity.eventbridge.event_bus_name
  description = module.service_entity.eventbridge.description
  tags        = module.service_entity.eventbridge.tags
}
