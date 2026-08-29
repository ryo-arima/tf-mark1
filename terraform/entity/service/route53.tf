variable "route53" {
  description = "Typed parameters passed to the Route 53 service module"

  type = object({
    zone_name     = string
    comment       = string
    force_destroy = bool
    tags          = map(string)
  })

  default  = null
  nullable = true
}
