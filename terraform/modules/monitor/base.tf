module "cloudwatch_logs" {
  source = "../../templates/services/cloudwatch_logs"

  config = {
    log_group_name    = "/ministack/${var.context.resource_prefix}/${trim(var.config.log_group_name, "/")}"
    retention_in_days = var.config.retention_in_days
    skip_destroy      = var.config.skip_destroy
    tags              = merge(var.context.common_tags, var.config.tags)
  }
}
