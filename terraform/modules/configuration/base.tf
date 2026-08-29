module "ssm" {
  source = "../../templates/services/ssm"

  config = {
    parameter_name = "/${var.context.resource_prefix}/${trim(var.config.parameter_name, "/")}"
    parameter_type = var.config.parameter_type
    value          = var.config.value
    description    = var.config.description
    tags           = merge(var.context.common_tags, var.config.tags)
  }
}
