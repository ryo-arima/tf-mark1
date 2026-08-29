module "service_entity" {
  source = "../../../entity/service"

  codebuild = var.config
}

resource "aws_codebuild_project" "this" {
  name          = module.service_entity.codebuild.project_name
  description   = module.service_entity.codebuild.description
  service_role  = module.service_entity.codebuild.service_role_arn
  build_timeout = module.service_entity.codebuild.build_timeout
  tags          = module.service_entity.codebuild.tags

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = module.service_entity.codebuild.compute_type
    image                       = module.service_entity.codebuild.build_image
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = module.service_entity.codebuild.privileged_mode
  }

  source {
    type      = "NO_SOURCE"
    buildspec = <<-EOT
      version: 0.2
      phases:
        build:
          commands:
            - echo "Local CodeBuild project is ready"
    EOT
  }
}
