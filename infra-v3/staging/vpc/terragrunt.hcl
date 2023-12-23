terraform {
    source = "../../../infra-modules/vpc"
}

include "root" {
    path = find_in_parent_folders()
}

inputs = {
    
  env             = "staging"
  azs             = ["us-east-1a", "us-east-1b"]
  vpc_cidr_block  = "10.0.0.0/16"
  private_subnets = ["10.0.0.0/24", "10.0.20.0/24"]
  public_subnets  = ["10.0.10.0/24", "10.0.30.0/24"]

  private_subnet_tags = {
    "kubernetes.io/cluster/staging-cluster" = "owned"
    "kubernetes.io/role/internal-elb" = "1"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/staging-cluster" = "owned"
    "kubernetes.io/role/elb"            = "1"
  }
}
