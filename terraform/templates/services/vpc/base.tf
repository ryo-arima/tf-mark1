module "service_entity" {
  source = "../../../entity/service"

  vpc = var.config
}

resource "aws_vpc" "this" {
  cidr_block           = module.service_entity.vpc.cidr_block
  enable_dns_support   = module.service_entity.vpc.enable_dns_support
  enable_dns_hostnames = module.service_entity.vpc.enable_dns_hostnames
  tags                 = merge(module.service_entity.vpc.tags, { Name = module.service_entity.vpc.name })
}

resource "aws_subnet" "this" {
  for_each = {
    for subnet in module.service_entity.vpc.subnets : subnet.name => subnet
  }

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags              = merge(module.service_entity.vpc.tags, { Name = "${module.service_entity.vpc.name}-${each.value.name}" })
}

moved {
  from = module.vpc.aws_vpc.this
  to   = aws_vpc.this
}
