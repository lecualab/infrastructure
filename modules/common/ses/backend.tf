terraform {
  backend "s3" {
    bucket = "lecualab-infrastructure-state"
    key    = "common/ses/terraform.tfstate"
    region = "us-east-1"
  }
}
