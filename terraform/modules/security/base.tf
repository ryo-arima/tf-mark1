module "kms" {
  source = "../../templates/services/kms"

  config = {
    alias_name              = "alias/${var.context.resource_prefix}-${trimprefix(var.config.key_alias, "alias/")}"
    description             = var.config.key_description
    enable_key_rotation     = var.config.enable_key_rotation
    deletion_window_in_days = var.config.deletion_window_in_days
    tags                    = merge(var.context.common_tags, var.config.tags)
  }
}
