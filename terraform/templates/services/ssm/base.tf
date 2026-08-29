module "service_entity" {
  source = "../../../entity/service"

  ssm = var.config
}

resource "aws_ssm_parameter" "this" {
  name        = module.service_entity.ssm.parameter_name
  description = module.service_entity.ssm.description
  type        = module.service_entity.ssm.parameter_type
  value       = module.service_entity.ssm.value
  tags        = module.service_entity.ssm.tags
}
