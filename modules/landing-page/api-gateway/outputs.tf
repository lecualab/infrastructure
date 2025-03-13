output "api_gateway" {
  description = "API Gateway information"
  value = {
    id           = aws_apigatewayv2_api.main.id
    name         = aws_apigatewayv2_api.main.name
    api_endpoint = aws_apigatewayv2_api.main.api_endpoint
  }
}
