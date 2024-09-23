terraform {
    required_version = ">= 0.12"
    required_providers {
      aws = {
        source ="hashicorp/aws"
        version = "~> 4.48.0"      
      }
    }
    backend "s3" {
      bucket = "dtc-terraform"
      key = "state"
      workspace_key_prefix = "dtc_class"
      region = "us-east-1"
      profile = "dtc_class"
    }
}
provider "aws" {
    region = "us-east-1"
    profile = "dtc_class"
}

resource "aws_instance" "dtc_ec2" {
    ami = "ami-0a0e5d9c7acc336f1"
    instance_type = "t2.micro"
    key_name = "terraform"
    tags = {
      Name = "test_instance1"
    }
}
