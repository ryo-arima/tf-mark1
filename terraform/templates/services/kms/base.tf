module "service_entity" {
  source = "../../../entity/service"

  kms = var.config
}

resource "aws_kms_key" "this" {
  description             = module.service_entity.kms.description
  enable_key_rotation     = module.service_entity.kms.enable_key_rotation
  deletion_window_in_days = module.service_entity.kms.deletion_window_in_days
  tags                    = module.service_entity.kms.tags
}

resource "aws_kms_alias" "this" {
  name          = module.service_entity.kms.alias_name
  target_key_id = aws_kms_key.this.key_id
}
