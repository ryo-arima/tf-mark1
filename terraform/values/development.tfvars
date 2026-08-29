aws_region         = "ap-northeast-1"
ministack_endpoint = "http://localhost:4566"

context = {
  project_name = "tf-mark1"
  common_tags = {
    Environment = "local"
    ManagedBy   = "terraform"
  }
}

network = {
  name                 = "core"
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = {}
}

compute = {
  cluster_name = "app"
  tags         = {}
}

storage = {
  table_name     = "locks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  hash_key_type  = "S"
  read_capacity  = 1
  write_capacity = 1
  tags           = {}
}

messaging = {
  queue_name                 = "jobs"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400
  tags                       = {}
}
