terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.92.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "testterraformbucket220325"

  tags = {
    Name        = "TestBucket"
    Environment = "DEV"
    Content     = "Upsa"
  }
}
