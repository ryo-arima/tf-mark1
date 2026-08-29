locals {
  // Values shared by every infrastructure concept module belong in this file.
  module_context = {
    resource_prefix = module.utilities.resource_prefix
    common_tags     = module.util_entity.context.common_tags
  }
}
