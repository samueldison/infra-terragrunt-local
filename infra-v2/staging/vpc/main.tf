provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "local" {
    path = "staging/vpc/terraform.tfstate"
  }
}

module "vpc" {
  source = "../../../infra-modules/vpc"

  env             = "staging"
  azs             = ["us-east-1a", "us-east-1b"]
  vpc_cidr_block  = "10.68.0.0/16"
  private_subnets = ["10.68.0.0/24", "10.68.0.48/24"]
  public_subnets  = ["10.68.0.96/24", "10.68.0.32/24"]

  private_subnet_tags = {
    "kubernetes.io/cluster/staging-cluster" = "owned"
    "kubernetes.io/role/internal-elb"       = "1"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/staging-cluster" = "owned"
    "kubernetes.io/role/elb"                = "1"
  }
}