module "locks_table" {
  source = "../../dynamodb"

  providers = {
    aws = aws
  }

  name           = var.config.table_name
  billing_mode   = var.config.billing_mode
  hash_key       = var.config.hash_key
  hash_key_type  = var.config.hash_key_type
  read_capacity  = var.config.read_capacity
  write_capacity = var.config.write_capacity
  tags           = var.config.tags
}
