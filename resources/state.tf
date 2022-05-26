terraform {
  required_version = "0.12.31"

  backend "s3" {
    bucket  = "mindeedtest"
    key     = "atlantis/terraform.tfstate"
    region  = "ap-south-1"
  }
}

provider "aws" {
  region  = "ap-south-1"
  version = "v2.60.0"
}