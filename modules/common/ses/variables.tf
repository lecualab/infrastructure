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

variable "ses_settings" {
  description = "The settings for the SES resources"
  type = object({
    domain_name    = string
    email_identity = string
  })
}
