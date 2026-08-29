output "api_endpoint" {
  description = "Endpoint of the API Gateway v2 API"
  value       = module.apigatewayv2.api_endpoint
}

output "api_id" {
  description = "ID of the API Gateway v2 API"
  value       = module.apigatewayv2.api_id
}

output "api_name" {
  description = "Name of the API Gateway v2 API"
  value       = module.apigatewayv2.api_name
}
