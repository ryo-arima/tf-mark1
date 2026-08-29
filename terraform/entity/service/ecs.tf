variable "ecs" {
  description = "Typed parameters passed to the ECS service module"

  type = object({
    cluster_name = string
    tags         = map(string)
  })

  default  = null
  nullable = true
}
