variable "registry" {
  description = "Typed parameters for the registry abstraction"

  type = object({
    repository_name      = string
    image_tag_mutability = optional(string, "MUTABLE")
    scan_on_push         = optional(bool, false)
    force_delete         = optional(bool, true)
    tags                 = optional(map(string), {})
  })

  validation {
    condition     = contains(["IMMUTABLE", "MUTABLE"], var.registry.image_tag_mutability)
    error_message = "registry.image_tag_mutability must be IMMUTABLE or MUTABLE."
  }
}
