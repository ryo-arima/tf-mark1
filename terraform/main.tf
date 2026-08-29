// The root module delegates infrastructure composition to the values layer.
module "infrastructure" {
  source = "./values"

  providers = {
    aws = aws
  }

  context   = var.context
  network   = var.network
  compute   = var.compute
  storage   = var.storage
  messaging = var.messaging
}
