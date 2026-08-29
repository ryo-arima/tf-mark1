module "route53" {
  source = "../../templates/services/route53"

  providers = {
    aws = aws
  }

  config = {
    zone_name     = var.config.zone_name
    comment       = var.config.comment
    force_destroy = var.config.force_destroy
    tags          = merge(var.common_tags, var.config.tags)
  }
}
