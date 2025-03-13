resource "aws_apigatewayv2_api" "main" {
  name                         = var.api_gateway_settings.name
  protocol_type                = var.api_gateway_settings.protocol_type
  disable_execute_api_endpoint = var.api_gateway_settings.disable_execute_api_endpoint

  cors_configuration {
    allow_origins     = var.api_gateway_settings.cors_settings.allow_origins
    allow_methods     = var.api_gateway_settings.cors_settings.allow_methods
    allow_headers     = var.api_gateway_settings.cors_settings.allow_headers
    allow_credentials = var.api_gateway_settings.cors_settings.allow_credentials
    expose_headers    = var.api_gateway_settings.cors_settings.expose_headers
    max_age           = var.api_gateway_settings.cors_settings.max_age
  }
}

resource "aws_apigatewayv2_stage" "main" {
  api_id      = aws_apigatewayv2_api.main.id
  name        = "$default"
  auto_deploy = true
}
