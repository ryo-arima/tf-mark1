module "apigatewayv2" {
  source = "../../templates/services/apigatewayv2"

  config = {
    api_name      = "${var.context.resource_prefix}-${var.config.api_name}"
    protocol_type = var.config.protocol_type
    description   = var.config.description
    tags          = merge(var.context.common_tags, var.config.tags)
  }
}
