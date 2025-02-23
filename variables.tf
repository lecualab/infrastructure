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
