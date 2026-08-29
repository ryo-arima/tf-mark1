variable "cicd" {
  description = "Typed parameters for the CI/CD abstraction"

  type = object({
    project_name    = string
    description     = optional(string, "")
    build_timeout   = optional(number, 30)
    compute_type    = optional(string, "BUILD_GENERAL1_SMALL")
    build_image     = optional(string, "aws/codebuild/standard:7.0")
    privileged_mode = optional(bool, false)
    tags            = optional(map(string), {})
  })

  validation {
    condition     = var.cicd.build_timeout >= 5 && var.cicd.build_timeout <= 2160
    error_message = "cicd.build_timeout must be between 5 and 2160 minutes."
  }

  validation {
    condition = contains([
      "BUILD_GENERAL1_SMALL",
      "BUILD_GENERAL1_MEDIUM",
      "BUILD_GENERAL1_LARGE",
      "BUILD_GENERAL1_XLARGE",
      "BUILD_GENERAL1_2XLARGE",
    ], var.cicd.compute_type)
    error_message = "cicd.compute_type must be a supported CodeBuild general-purpose compute type."
  }
}
