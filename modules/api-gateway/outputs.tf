output "api_gateway" {
  description = "API Gateway information"
  value = [for api in aws_apigatewayv2_api.main : {
    id           = api.id
    name         = api.name
    api_endpoint = api.api_endpoint
  }]
}
