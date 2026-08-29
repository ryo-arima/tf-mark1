module "elbv2" {
  source = "../../templates/services/elbv2"

  config = {
    name                       = "${var.context.resource_prefix}-${var.config.name}"
    internal                   = var.config.internal
    subnet_ids                 = var.subnet_ids
    listener_port              = var.config.listener_port
    idle_timeout               = var.config.idle_timeout
    enable_deletion_protection = var.config.enable_deletion_protection
    tags                       = merge(var.context.common_tags, var.config.tags)
  }
}
