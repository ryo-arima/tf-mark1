variable "apigatewayv2" {
  description = "Typed parameters passed to the API Gateway v2 service module"

  type = object({
    api_name      = string
    protocol_type = string
    description   = string
    tags          = map(string)
  })

  default  = null
  nullable = true

  validation {
    condition     = var.apigatewayv2 == null ? true : contains(["HTTP", "WEBSOCKET"], var.apigatewayv2.protocol_type)
    error_message = "apigatewayv2.protocol_type must be HTTP or WEBSOCKET."
  }
}
