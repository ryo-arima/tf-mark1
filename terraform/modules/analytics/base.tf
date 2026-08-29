module "glue" {
  source = "../../templates/services/glue"

  providers = {
    aws = aws
  }

  config = {
    database_name = lower(replace("${var.resource_prefix}_${var.config.database_name}", "-", "_"))
    description   = var.config.description
    tags          = merge(var.common_tags, var.config.tags)
  }
}
