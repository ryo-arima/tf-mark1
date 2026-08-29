module "service_entity" {
  source = "../../../entity/service"

  cloudwatch_logs = var.config
}

resource "aws_cloudwatch_log_group" "this" {
  name              = module.service_entity.cloudwatch_logs.log_group_name
  retention_in_days = module.service_entity.cloudwatch_logs.retention_in_days
  skip_destroy      = module.service_entity.cloudwatch_logs.skip_destroy
  tags              = module.service_entity.cloudwatch_logs.tags
}
