terraform {
  backend "s3" {
    bucket = "lecualab-infrastructure-state"
    key    = "databases/terraform.tfstate"
    region = "us-east-1"
  }
}
