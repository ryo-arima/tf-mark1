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
  subnets = [
    {
      name              = "public-a"
      cidr_block        = "10.0.1.0/24"
      availability_zone = "ap-northeast-1a"
    },
    {
      name              = "public-c"
      cidr_block        = "10.0.2.0/24"
      availability_zone = "ap-northeast-1c"
    },
  ]
  tags                 = {}
}

compute = {
  cluster_name = "app"
  tags         = {}
}

datastore = {
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

api = {
  api_name      = "application"
  protocol_type = "HTTP"
  description   = "Local application API"
  tags          = {}
}

analytics = {
  database_name = "application"
  description   = "Local application data catalog"
  tags          = {}
}

configuration = {
  parameter_name = "environment"
  parameter_type = "String"
  value          = "development"
  description    = "Application environment name"
  tags           = {}
}

dns = {
  zone_name     = "tf-mark1.local"
  comment       = "Local development hosted zone"
  force_destroy = true
  tags          = {}
}

event = {
  event_bus_name = "application"
  description    = "Local application event bus"
  tags           = {}
}

monitor = {
  log_group_name    = "application"
  retention_in_days = 7
  skip_destroy      = false
  tags              = {}
}

registry = {
  repository_name      = "application"
  image_tag_mutability = "MUTABLE"
  scan_on_push         = false
  force_delete         = true
  tags                 = {}
}

security = {
  key_alias               = "infrastructure"
  key_description         = "Local infrastructure encryption key"
  enable_key_rotation     = true
  deletion_window_in_days = 7
  tags                    = {}
}

loadbalancer = {
  name                       = "application"
  internal                   = true
  listener_port              = 80
  idle_timeout               = 60
  enable_deletion_protection = false
  tags                       = {}
}

cicd = {
  project_name    = "application"
  description     = "Local application build project"
  build_timeout   = 30
  compute_type    = "BUILD_GENERAL1_SMALL"
  build_image     = "aws/codebuild/standard:7.0"
  privileged_mode = false
  tags            = {}
}

iam = {
  role_name       = "application-codebuild"
  description     = "Service role for the local CodeBuild project"
  trusted_service = "codebuild.amazonaws.com"
  tags            = {}
}
