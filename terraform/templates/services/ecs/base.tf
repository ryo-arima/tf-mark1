module "service_entity" {
  source = "../../../entity/service"

  ecs = var.config
}

resource "aws_ecs_cluster" "this" {
  name = module.service_entity.ecs.cluster_name
  tags = module.service_entity.ecs.tags
}

moved {
  from = module.cluster.aws_ecs_cluster.this
  to   = aws_ecs_cluster.this
}
