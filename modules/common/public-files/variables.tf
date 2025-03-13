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

variable "s3_settings" {
  description = "The settings for the S3 resource"
  type = object({
    bucket_name = string
  })
  default = {
    bucket_name = "lecualab-public-files"
  }
}

variable "cloudfront_settings" {
  description = "The settings for the CloudFront resource"
  type = object({
    domain_name = string
  })
  default = {
    domain_name = "public-files.lecualab.com"
  }
}

variable "acm_settings" {
  description = "The settings for the ACM resource"
  type = object({
    domain_name = string
  })
  default = {
    domain_name = "public-files.lecualab.com"
  }
}
