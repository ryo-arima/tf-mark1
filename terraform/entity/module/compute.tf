variable "compute" {
  description = "Typed parameters for the compute abstraction"

  type = object({
    cluster_name = string
    tags         = optional(map(string), {})
  })
}
