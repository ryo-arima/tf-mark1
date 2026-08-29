module "service_entity" {
  source = "../../entity/service"

  vpc = {
    name                 = "${var.resource_prefix}-${var.config.name}"
    cidr_block           = var.config.cidr_block
    enable_dns_support   = var.config.enable_dns_support
    enable_dns_hostnames = var.config.enable_dns_hostnames
    tags                 = merge(var.common_tags, var.config.tags)
  }
}

module "vpc" {
  source = "../../templates/services/vpc"

  providers = {
    aws = aws
  }

  config = module.service_entity.vpc
}
