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
  source = "../templates/utils"

  project_name = module.util_entity.context.project_name
}

module "network" {
  source = "../modules/network"

  context = local.module_context
  config  = module.module_entity.network
}

module "compute" {
  source = "../modules/compute"

  context = local.module_context
  config  = module.module_entity.compute
}

module "datastore" {
  source = "../modules/datastore"

  context = local.module_context
  config  = module.module_entity.datastore
}

module "messaging" {
  source = "../modules/messaging"

  context = local.module_context
  config  = module.module_entity.messaging
}

module "api" {
  source = "../modules/api"

  context = local.module_context
  config  = module.module_entity.api
}

module "analytics" {
  source = "../modules/analytics"

  context = local.module_context
  config  = module.module_entity.analytics
}

module "configuration" {
  source = "../modules/configuration"

  context = local.module_context
  config  = module.module_entity.configuration
}

module "dns" {
  source = "../modules/dns"

  context = local.module_context
  config  = module.module_entity.dns
}

module "event" {
  source = "../modules/event"

  context = local.module_context
  config  = module.module_entity.event
}

module "monitor" {
  source = "../modules/monitor"

  context = local.module_context
  config  = module.module_entity.monitor
}

module "registry" {
  source = "../modules/registry"

  context = local.module_context
  config  = module.module_entity.registry
}

module "security" {
  source = "../modules/security"

  context = local.module_context
  config  = module.module_entity.security
}

module "loadbalancer" {
  source = "../modules/loadbalancer"

  context    = local.module_context
  subnet_ids = module.network.subnet_ids
  config     = module.module_entity.loadbalancer
}

module "cicd" {
  source = "../modules/cicd"

  context          = local.module_context
  service_role_arn = module.iam.role_arn
  config           = module.module_entity.cicd
}

module "iam" {
  source = "../modules/iam"

  context = local.module_context
  config  = module.module_entity.iam
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
