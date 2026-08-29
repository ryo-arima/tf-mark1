module "dynamodb" {
  source = "../../templates/services/dynamodb"

  providers = {
    aws = aws
  }

  config = {
    table_name     = "${var.resource_prefix}-${var.config.table_name}"
    billing_mode   = var.config.billing_mode
    hash_key       = var.config.hash_key
    hash_key_type  = var.config.hash_key_type
    read_capacity  = var.config.read_capacity
    write_capacity = var.config.write_capacity
    tags           = merge(var.common_tags, var.config.tags)
  }
}
