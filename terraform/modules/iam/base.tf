module "iam" {
  source = "../../templates/services/iam"

  config = {
    role_name   = "${var.context.resource_prefix}-${var.config.role_name}"
    description = var.config.description
    assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [{
        Effect = "Allow"
        Principal = {
          Service = var.config.trusted_service
        }
        Action = "sts:AssumeRole"
      }]
    })
    tags = merge(var.context.common_tags, var.config.tags)
  }
}
