variable "glue" {
  description = "Typed parameters passed to the Glue service module"

  type = object({
    database_name = string
    description   = string
    tags          = map(string)
  })

  default  = null
  nullable = true
}
