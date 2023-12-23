provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "local" {
    path = "dev/vpc/terraform.tfstate"
  }
}

module "vpc" {
  source = "../../../infra-modules/vpc"

  env             = "dev"
  azs             = ["us-east-1a", "us-east-1b"]
  vpc_cidr_block  = "198.68.0.0/16"
  private_subnets = ["198.68.0.0/24", "198.68.0.48/24"]
  public_subnets  = ["198.68.0.96/24", "198.68.0.32/24"]

  private_subnet_tags = {
    "kubernetes.io/cluster/dev-cluster" = "owned"
    "kubernetes.io/role/internal-elb" = "1"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/dev-cluster" = "owned"
    "kubernetes.io/role/elb"            = "1"
  }
}