module "apigatewayv2" {
  source = "../../templates/services/apigatewayv2"

  providers = {
    aws = aws
  }

  config = {
    api_name      = "${var.resource_prefix}-${var.config.api_name}"
    protocol_type = var.config.protocol_type
    description   = var.config.description
    tags          = merge(var.common_tags, var.config.tags)
  }
}
