module "ssm" {
  source = "../../templates/services/ssm"

  providers = {
    aws = aws
  }

  config = {
    parameter_name = "/${var.resource_prefix}/${trim(var.config.parameter_name, "/")}"
    parameter_type = var.config.parameter_type
    value          = var.config.value
    description    = var.config.description
    tags           = merge(var.common_tags, var.config.tags)
  }
}
