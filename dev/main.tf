provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "davathuvaaribucket"
    key    = "dev.tfstate"
    region = "us-east-1"
  }
}