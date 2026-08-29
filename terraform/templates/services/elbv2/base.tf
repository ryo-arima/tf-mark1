module "service_entity" {
  source = "../../../entity/service"

  elbv2 = var.config
}

resource "aws_lb" "this" {
  name                       = module.service_entity.elbv2.name
  internal                   = module.service_entity.elbv2.internal
  load_balancer_type         = "application"
  subnets                    = module.service_entity.elbv2.subnet_ids
  idle_timeout               = module.service_entity.elbv2.idle_timeout
  enable_deletion_protection = module.service_entity.elbv2.enable_deletion_protection
  tags                       = module.service_entity.elbv2.tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = module.service_entity.elbv2.listener_port
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "MiniStack load balancer is ready"
      status_code  = "200"
    }
  }

  tags = module.service_entity.elbv2.tags
}
