module "cloudwatch_logs" {
  source = "../../templates/services/cloudwatch_logs"

  providers = {
    aws = aws
  }

  config = {
    log_group_name    = "/ministack/${var.resource_prefix}/${trim(var.config.log_group_name, "/")}"
    retention_in_days = var.config.retention_in_days
    skip_destroy      = var.config.skip_destroy
    tags              = merge(var.common_tags, var.config.tags)
  }
}
