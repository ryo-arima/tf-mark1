output "project_arn" {
  description = "ARN of the CodeBuild project"
  value       = module.codebuild.project_arn
}

output "project_name" {
  description = "Name of the CodeBuild project"
  value       = module.codebuild.project_name
}
