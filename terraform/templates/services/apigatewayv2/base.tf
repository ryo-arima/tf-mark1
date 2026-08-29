module "service_entity" {
  source = "../../../entity/service"

  apigatewayv2 = var.config
}

resource "aws_apigatewayv2_api" "this" {
  name          = module.service_entity.apigatewayv2.api_name
  protocol_type = module.service_entity.apigatewayv2.protocol_type
  description   = module.service_entity.apigatewayv2.description
  tags          = module.service_entity.apigatewayv2.tags
}
