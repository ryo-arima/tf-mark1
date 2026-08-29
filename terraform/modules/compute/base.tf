module "service_entity" {
  source = "../../entity/service"

  ecs = {
    cluster_name = "${var.resource_prefix}-${var.config.cluster_name}"
    tags         = merge(var.common_tags, var.config.tags)
  }
}

module "ecs" {
  source = "../../templates/services/ecs"

  providers = {
    aws = aws
  }

  config = module.service_entity.ecs
}
