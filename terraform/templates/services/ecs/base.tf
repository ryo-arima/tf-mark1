module "cluster" {
  source = "../../ecs"

  providers = {
    aws = aws
  }

  name = var.config.cluster_name
  tags = var.config.tags
}
