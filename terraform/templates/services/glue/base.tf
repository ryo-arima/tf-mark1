module "service_entity" {
  source = "../../../entity/service"

  glue = var.config
}

resource "aws_glue_catalog_database" "this" {
  name        = module.service_entity.glue.database_name
  description = module.service_entity.glue.description
  tags        = module.service_entity.glue.tags
}
