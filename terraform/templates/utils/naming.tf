locals {
  // Shared naming normalization belongs in the utility template rather than service modules.
  resource_prefix = lower(trimspace(var.project_name))
}
