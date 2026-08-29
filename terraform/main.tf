// The root module delegates infrastructure composition to the values layer.
module "infrastructure" {
  source = "./values"

  context       = var.context
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
