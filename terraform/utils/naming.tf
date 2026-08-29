locals {
  // Shared naming normalization belongs in utils rather than service modules.
  resource_prefix = lower(trimspace(var.project_name))
}
