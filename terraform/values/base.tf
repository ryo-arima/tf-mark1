module "util_entity" {
  source = "../entity/util"

  context = var.context
}

module "module_entity" {
  source = "../entity/module"

  network   = var.network
  compute   = var.compute
  storage   = var.storage
  messaging = var.messaging
}

module "utilities" {
  source = "../utils"

  project_name = module.util_entity.context.project_name
}

module "network" {
  source = "../modules/network"

  providers = {
    aws = aws
  }

  resource_prefix = module.utilities.resource_prefix
  common_tags     = module.util_entity.context.common_tags
  config          = module.module_entity.network
}

module "compute" {
  source = "../modules/compute"

  providers = {
    aws = aws
  }

  resource_prefix = module.utilities.resource_prefix
  common_tags     = module.util_entity.context.common_tags
  config          = module.module_entity.compute
}

module "storage" {
  source = "../modules/storage"

  providers = {
    aws = aws
  }

  resource_prefix = module.utilities.resource_prefix
  common_tags     = module.util_entity.context.common_tags
  config          = module.module_entity.storage
}

module "messaging" {
  source = "../modules/messaging"

  providers = {
    aws = aws
  }

  resource_prefix = module.utilities.resource_prefix
  common_tags     = module.util_entity.context.common_tags
  config          = module.module_entity.messaging
}
