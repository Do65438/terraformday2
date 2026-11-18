provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "davathuvaaribucket"
    key    = "uat.tfstate"
    region = "us-east-1"
  }
}