module "ecs" {
  source = "../../templates/services/ecs"

  config = {
    cluster_name = "${var.context.resource_prefix}-${var.config.cluster_name}"
    tags         = merge(var.context.common_tags, var.config.tags)
  }
}
