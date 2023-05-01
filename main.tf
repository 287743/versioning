terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "ap-southeast-1"
  access_key = "AKIA4JWCASQRLPNZ2B5I"
  secret_key = "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"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}

# resource "aws_s3_bucket" "terraform_state_bucket" {
#  bucket = "yogesh"
#  acl    = "private"
#  versioning {
#    enabled = true
#  }
# }

# resource "aws_dynamodb_table" "terraform_state_lock" {
#  name           = "raju"
#  billing_mode   = "PAY_PER_REQUEST"
#  hash_key       = "LockID"
#  attribute {
#    name = "LockID"
#    type = "S"
#  }
# }