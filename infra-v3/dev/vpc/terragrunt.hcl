terraform {
  source = "../../../infra-modules/vpc"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
    
  env             = "dev"
  azs             = ["us-east-1a", "us-east-1b"]
  vpc_cidr_block  = "192.168.0.0/16"
  private_subnets = ["198.168.16.0/24", "198.168.48.0/24"]
  public_subnets  = ["198.168.80.0/24", "198.168.32.0/24"]

  private_subnet_tags = {
    "kubernetes.io/cluster/dev-cluster" = "owned"
    "kubernetes.io/role/internal-elb" = "1"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/dev-cluster" = "owned"
    "kubernetes.io/role/elb"            = "1"
  }
}
