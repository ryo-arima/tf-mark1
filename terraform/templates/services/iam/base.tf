module "service_entity" {
  source = "../../../entity/service"

  iam = var.config
}

resource "aws_iam_role" "this" {
  name               = module.service_entity.iam.role_name
  description        = module.service_entity.iam.description
  assume_role_policy = module.service_entity.iam.assume_role_policy
  tags               = module.service_entity.iam.tags
}
