resource "aws_apigatewayv2_api" "main" {
  for_each = tomap(var.api_gateway_settings)

  name          = each.value.name
  protocol_type = each.value.protocol_type

  cors_configuration {
    allow_origins     = each.value.cors_settings.allow_origins
    allow_methods     = each.value.cors_settings.allow_methods
    allow_headers     = each.value.cors_settings.allow_headers
    allow_credentials = each.value.cors_settings.allow_credentials
    expose_headers    = each.value.cors_settings.expose_headers
    max_age           = each.value.cors_settings.max_age
  }
}

resource "aws_apigatewayv2_stage" "main" {
  for_each = tomap(var.api_gateway_settings)

  api_id      = aws_apigatewayv2_api.main[each.key].id
  name        = "$default"
  auto_deploy = true
}
