terraform {
  backend "s3" {
    bucket = "lecualab-infrastructure-state"
    key    = "landing-page/rds/terraform.tfstate"
    region = "us-east-1"
  }
}
