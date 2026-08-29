module "service_entity" {
  source = "../../../entity/service"

  route53 = var.config
}

resource "aws_route53_zone" "this" {
  name          = module.service_entity.route53.zone_name
  comment       = module.service_entity.route53.comment
  force_destroy = module.service_entity.route53.force_destroy
  tags          = module.service_entity.route53.tags
}
