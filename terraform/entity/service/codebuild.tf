variable "codebuild" {
  description = "Typed parameters passed to the CodeBuild service module"

  type = object({
    project_name     = string
    description      = string
    service_role_arn = string
    build_timeout    = number
    compute_type     = string
    build_image      = string
    privileged_mode  = bool
    tags             = map(string)
  })

  default  = null
  nullable = true

  validation {
    condition     = var.codebuild == null ? true : var.codebuild.build_timeout >= 5 && var.codebuild.build_timeout <= 2160
    error_message = "codebuild.build_timeout must be between 5 and 2160 minutes."
  }
}
