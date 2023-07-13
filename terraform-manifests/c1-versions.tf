# Terraform Block
terraform {
  required_version = ">= 1.5.1" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region = var.aws_region
  profile = "default"
}

# Create Random Pet Resource
resource "random_pet" "this" {
  length = 2
}