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
  description = "The settings for the API Gateway resources"
  type = map(object({
    name          = string
    protocol_type = string
    cors_settings = object({
      allow_origins     = list(string)
      allow_methods     = list(string)
      allow_headers     = list(string)
      expose_headers    = list(string)
      allow_credentials = bool
      max_age           = number
    })
  }))
  default = {
    landing_page = {
      name          = "landing_page"
      protocol_type = "HTTP"
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
}
