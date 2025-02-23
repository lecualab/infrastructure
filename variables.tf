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

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_count" {
  description = "The number of subnets to create"
  type        = map(number)
  default = {
    public  = 1
    private = 2
  }
}

variable "rds_settings" {
  description = "The settings for the RDS resources"
  type = map(object({
    identifier          = string
    engine              = string
    engine_version      = string
    instance_class      = string
    db_name             = string
    username            = string
    deletion_protection = bool
  }))
  default = {
    landing_page = {
      identifier          = "landing-page"
      engine              = "postgres"
      engine_version      = "17.4"
      instance_class      = "db.t4g.micro"
      db_name             = "landing_page"
      username            = "landing_page"
      deletion_protection = false
    }
  }
}

variable "ec2_settings" {
  description = "The settings for the EC2 instances"
  type = map(object({
    instance_type = string
  }))
  default = {
    bastion = {
      instance_type = "t2.micro"
    }
  }
}

variable "key_pair_settings" {
  description = "The settings for the key pairs"
  type = map(object({
    public_key_path = string
  }))
}

variable "ses_settings" {
  description = "The settings for the SES resources"
  sensitive   = true
  type = object({
    domain_name    = string
    email_identity = string
  })
}

variable "public_subnet_cidr_blocks" {
  description = "The CIDR block for the public subnet"
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24"
  ]
}

variable "private_subnet_cidr_blocks" {
  description = "The CIDR block for the private subnet"
  type        = list(string)
  default = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24"
  ]
}
