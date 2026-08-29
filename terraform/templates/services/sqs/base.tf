module "service_entity" {
  source = "../../../entity/service"

  sqs = var.config
}

resource "aws_sqs_queue" "this" {
  name                       = module.service_entity.sqs.queue_name
  visibility_timeout_seconds = module.service_entity.sqs.visibility_timeout_seconds
  message_retention_seconds  = module.service_entity.sqs.message_retention_seconds
  tags                       = module.service_entity.sqs.tags
}

moved {
  from = module.jobs_queue.aws_sqs_queue.this
  to   = aws_sqs_queue.this
}
