module "vpc" {
  source = "../../templates/services/vpc"

  config = {
    name                 = "${var.context.resource_prefix}-${var.config.name}"
    cidr_block           = var.config.cidr_block
    enable_dns_support   = var.config.enable_dns_support
    enable_dns_hostnames = var.config.enable_dns_hostnames
    subnets              = var.config.subnets
    tags                 = merge(var.context.common_tags, var.config.tags)
  }
}
