terraform {
  source = "../../../infra-modules/eks"
}

include "root" {
  path    = find_in_parent_folders()
}

include "env" {
  path            = find_in_parent_folders("env.hcl")
  expose          = true
  merge_strategy  = "no_merge"
}

inputs = {  
  env             = include.env.locals.env
  eks_version     = "1.27"
  eks_name        = "eks_cluster"
  subnet_ids      = dependency.vpc.outputs.private_subnet_ids
  ec2_ssh_key     = "ralp-craven"
  source_security_groups_ids = dependency.sec_grp.outputs.security_group_id


  node_groups = {
    general = {
      capacity_type    = "ON_DEMAND"
      instance_types   = ["t3.medium"]
      disk_size        = 20
      scaling_config   = {
        desired_size   = 2
        max_size       = 3
        min_size       = 1
      }
    }
  }
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id             ="vpc-abc123"
    private_subnet_ids = ["subnet-abc123", "subnet-def456"]
  }
}
