module "ecr" {
  source = "../../templates/services/ecr"

  providers = {
    aws = aws
  }

  config = {
    repository_name      = lower("${var.resource_prefix}-${var.config.repository_name}")
    image_tag_mutability = var.config.image_tag_mutability
    scan_on_push         = var.config.scan_on_push
    force_delete         = var.config.force_delete
    tags                 = merge(var.common_tags, var.config.tags)
  }
}
