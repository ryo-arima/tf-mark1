module "codebuild" {
  source = "../../templates/services/codebuild"

  providers = {
    aws = aws
  }

  config = {
    project_name     = "${var.resource_prefix}-${var.config.project_name}"
    description      = var.config.description
    service_role_arn = var.service_role_arn
    build_timeout    = var.config.build_timeout
    compute_type     = var.config.compute_type
    build_image      = var.config.build_image
    privileged_mode  = var.config.privileged_mode
    tags             = merge(var.common_tags, var.config.tags)
  }
}
