variable "ecr" {
  description = "Typed parameters passed to the ECR service module"

  type = object({
    repository_name      = string
    image_tag_mutability = string
    scan_on_push         = bool
    force_delete         = bool
    tags                 = map(string)
  })

  default  = null
  nullable = true

  validation {
    condition     = var.ecr == null ? true : contains(["IMMUTABLE", "MUTABLE"], var.ecr.image_tag_mutability)
    error_message = "ecr.image_tag_mutability must be IMMUTABLE or MUTABLE."
  }
}
