module "service_entity" {
  source = "../../entity/service"

  sqs = {
    queue_name                 = "${var.resource_prefix}-${var.config.queue_name}"
    visibility_timeout_seconds = var.config.visibility_timeout_seconds
    message_retention_seconds  = var.config.message_retention_seconds
    tags                       = merge(var.common_tags, var.config.tags)
  }
}

module "sqs" {
  source = "../../templates/services/sqs"

  providers = {
    aws = aws
  }

  config = module.service_entity.sqs
}
