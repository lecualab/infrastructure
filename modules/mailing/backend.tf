terraform {
  backend "s3" {
    bucket = "lecualab-infrastructure-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
