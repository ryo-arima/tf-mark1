module "glue" {
  source = "../../templates/services/glue"

  config = {
    database_name = lower(replace("${var.context.resource_prefix}_${var.config.database_name}", "-", "_"))
    description   = var.config.description
    tags          = merge(var.context.common_tags, var.config.tags)
  }
}
