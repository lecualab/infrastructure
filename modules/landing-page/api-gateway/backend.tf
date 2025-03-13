terraform {
  backend "s3" {
    bucket = "lecualab-infrastructure-state"
    key    = "landing-page/api-gateway/terraform.tfstate"
    region = "us-east-1"
  }
}
