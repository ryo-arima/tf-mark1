resource "aws_dynamodb_table" "this" {
  name           = var.name
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key
  read_capacity  = var.billing_mode == "PROVISIONED" ? var.read_capacity : null
  write_capacity = var.billing_mode == "PROVISIONED" ? var.write_capacity : null
  tags           = var.tags

  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }
}
