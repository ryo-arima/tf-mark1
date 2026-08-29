module "service_entity" {
  source = "../../../entity/service"

  dynamodb = var.config
}

resource "aws_dynamodb_table" "this" {
  name           = module.service_entity.dynamodb.table_name
  billing_mode   = module.service_entity.dynamodb.billing_mode
  hash_key       = module.service_entity.dynamodb.hash_key
  read_capacity  = module.service_entity.dynamodb.billing_mode == "PROVISIONED" ? module.service_entity.dynamodb.read_capacity : null
  write_capacity = module.service_entity.dynamodb.billing_mode == "PROVISIONED" ? module.service_entity.dynamodb.write_capacity : null
  tags           = module.service_entity.dynamodb.tags

  attribute {
    name = module.service_entity.dynamodb.hash_key
    type = module.service_entity.dynamodb.hash_key_type
  }
}

moved {
  from = module.locks_table.aws_dynamodb_table.this
  to   = aws_dynamodb_table.this
}
