module "util_entity" {
  source = "../entity/util"

  context = var.context
}

module "module_entity" {
  source = "../entity/module"

  network       = var.network
  compute       = var.compute
  datastore     = var.datastore
  messaging     = var.messaging
  api           = var.api
  analytics     = var.analytics
  configuration = var.configuration
  dns           = var.dns
  event         = var.event
  monitor       = var.monitor
  registry      = var.registry
  security      = var.security
  loadbalancer  = var.loadbalancer
  cicd          = var.cicd
  iam           = var.iam
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

module "datastore" {
  source = "../modules/datastore"

  providers = {
    aws = aws
  }

  resource_prefix = module.utilities.resource_prefix
  common_tags     = module.util_entity.context.common_tags
  config          = module.module_entity.datastore
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

module "api" {
  source = "../modules/api"

  providers = {
    aws = aws
  }

  resource_prefix = module.utilities.resource_prefix
  common_tags     = module.util_entity.context.common_tags
  config          = module.module_entity.api
}

module "analytics" {
  source = "../modules/analytics"

  providers = {
    aws = aws
  }

  resource_prefix = module.utilities.resource_prefix
  common_tags     = module.util_entity.context.common_tags
  config          = module.module_entity.analytics
}

module "configuration" {
  source = "../modules/configuration"

  providers = {
    aws = aws
  }

  resource_prefix = module.utilities.resource_prefix
  common_tags     = module.util_entity.context.common_tags
  config          = module.module_entity.configuration
}

module "dns" {
  source = "../modules/dns"

  providers = {
    aws = aws
  }

  common_tags = module.util_entity.context.common_tags
  config      = module.module_entity.dns
}

module "event" {
  source = "../modules/event"

  providers = {
    aws = aws
  }

  resource_prefix = module.utilities.resource_prefix
  common_tags     = module.util_entity.context.common_tags
  config          = module.module_entity.event
}

module "monitor" {
  source = "../modules/monitor"

  providers = {
    aws = aws
  }

  resource_prefix = module.utilities.resource_prefix
  common_tags     = module.util_entity.context.common_tags
  config          = module.module_entity.monitor
}

module "registry" {
  source = "../modules/registry"

  providers = {
    aws = aws
  }

  resource_prefix = module.utilities.resource_prefix
  common_tags     = module.util_entity.context.common_tags
  config          = module.module_entity.registry
}

module "security" {
  source = "../modules/security"

  providers = {
    aws = aws
  }

  resource_prefix = module.utilities.resource_prefix
  common_tags     = module.util_entity.context.common_tags
  config          = module.module_entity.security
}

module "loadbalancer" {
  source = "../modules/loadbalancer"

  providers = {
    aws = aws
  }

  resource_prefix = module.utilities.resource_prefix
  common_tags     = module.util_entity.context.common_tags
  subnet_ids      = module.network.subnet_ids
  config          = module.module_entity.loadbalancer
}

module "cicd" {
  source = "../modules/cicd"

  providers = {
    aws = aws
  }

  resource_prefix  = module.utilities.resource_prefix
  common_tags      = module.util_entity.context.common_tags
  service_role_arn = module.iam.role_arn
  config           = module.module_entity.cicd
}

module "iam" {
  source = "../modules/iam"

  providers = {
    aws = aws
  }

  resource_prefix = module.utilities.resource_prefix
  common_tags     = module.util_entity.context.common_tags
  config          = module.module_entity.iam
}

moved {
  from = module.storage
  to   = module.datastore
}

moved {
  from = module.integration
  to   = module.event
}

moved {
  from = module.logging
  to   = module.monitor
}

moved {
  from = module.cicd.module.iam
  to   = module.iam.module.iam
}
