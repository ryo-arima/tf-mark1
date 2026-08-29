module "service_entity" {
  source = "../../../entity/service"

  ecr = var.config
}

resource "aws_ecr_repository" "this" {
  name                 = module.service_entity.ecr.repository_name
  image_tag_mutability = module.service_entity.ecr.image_tag_mutability
  force_delete         = module.service_entity.ecr.force_delete
  tags                 = module.service_entity.ecr.tags

  image_scanning_configuration {
    scan_on_push = module.service_entity.ecr.scan_on_push
  }
}
