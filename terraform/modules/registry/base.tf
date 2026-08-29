module "ecr" {
  source = "../../templates/services/ecr"

  config = {
    repository_name      = lower("${var.context.resource_prefix}-${var.config.repository_name}")
    image_tag_mutability = var.config.image_tag_mutability
    scan_on_push         = var.config.scan_on_push
    force_delete         = var.config.force_delete
    tags                 = merge(var.context.common_tags, var.config.tags)
  }
}
