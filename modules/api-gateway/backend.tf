terraform {
  backend "s3" {
    bucket = "lecualab-infrastructure-state"
    key    = "api-gateway/terraform.tfstate"
    region = "us-east-1"
  }
}
