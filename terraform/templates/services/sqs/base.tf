module "jobs_queue" {
  source = "../../sqs"

  providers = {
    aws = aws
  }

  name                       = var.config.queue_name
  visibility_timeout_seconds = var.config.visibility_timeout_seconds
  message_retention_seconds  = var.config.message_retention_seconds
  tags                       = var.config.tags
}
