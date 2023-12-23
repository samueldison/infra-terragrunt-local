terraform {
  source = "../../../infra-modules/sec_grp"
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
  env         = include.env.locals.env
  vpc_id      = dependency.vpc.outputs.vpc_id
  ingress     = [22, 80]
  cidr_blocks = ["0.0.0.0/0"]
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id             ="vpc-abc123"
  }
}
