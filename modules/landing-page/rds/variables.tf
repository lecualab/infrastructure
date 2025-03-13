variable "environment" {
  description = "The environment in which the resources are created"
  type        = string
  default     = "production"
}

variable "projects" {
  description = "The name of the project"
  type        = map(string)
  default = {
    landing_page = "landing-page"
  }
}

variable "region" {
  description = "The region in which the resources are created"
  type        = string
  default     = "us-east-1"
}

variable "rds_settings" {
  description = "The settings for the RDS resources"
  type = map(object({
    identifier          = string
    engine              = string
    engine_version      = string
    instance_class      = string
    username            = string
    publicly_accessible = bool
  }))
  default = {
    landing_page = {
      identifier          = "landing-page"
      engine              = "postgres"
      engine_version      = "17.4"
      instance_class      = "db.t4g.micro"
      username            = "landing_page"
      publicly_accessible = true
    }
  }
}
