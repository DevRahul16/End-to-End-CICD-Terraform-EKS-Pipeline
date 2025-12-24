provider "aws" {
  region = "ap-south-1"
}

module "eks" {
  source = "./eks"
}

