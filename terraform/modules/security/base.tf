module "kms" {
  source = "../../templates/services/kms"

  providers = {
    aws = aws
  }

  config = {
    alias_name              = "alias/${var.resource_prefix}-${trimprefix(var.config.key_alias, "alias/")}"
    description             = var.config.key_description
    enable_key_rotation     = var.config.enable_key_rotation
    deletion_window_in_days = var.config.deletion_window_in_days
    tags                    = merge(var.common_tags, var.config.tags)
  }
}
