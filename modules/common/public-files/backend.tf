terraform {
  backend "s3" {
    bucket = "lecualab-infrastructure-state"
    key    = "common/public-files/terraform.tfstate"
    region = "us-east-1"
  }
}
