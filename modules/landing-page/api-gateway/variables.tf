variable "environment" {
  description = "The environment in which the resources are created"
  type        = string
  default     = "production"
}

variable "region" {
  description = "The region in which the resources are created"
  type        = string
  default     = "us-east-1"
}

variable "api_gateway_settings" {
  description = "The settings for the API Gateway"
  type = object({
    name                         = string
    protocol_type                = string
    disable_execute_api_endpoint = bool
    cors_settings = object({
      allow_origins     = list(string)
      allow_methods     = list(string)
      allow_headers     = list(string)
      expose_headers    = list(string)
      allow_credentials = bool
      max_age           = number
    })
  })
  default = {
    name                         = "landing_page"
    protocol_type                = "HTTP"
    disable_execute_api_endpoint = false
    cors_settings = {
      allow_origins     = ["http://localhost:4200", "https://www.lecualab.com"]
      allow_methods     = ["*"]
      allow_headers     = ["*"]
      expose_headers    = ["*"]
      allow_credentials = false
      max_age           = 3600
    }
  }
}
