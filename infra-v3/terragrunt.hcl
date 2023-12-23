# Configure Terragrunt to use local backend
remote_state {
  backend   = "local"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  # Define the key for the Terraform state file
  config = {
    path = "${path_relative_to_include()}/terraform.tfstate"
  }
}

# Generate a provider block for AWS
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
provider "aws" {
  region = "us-east-1"
} 
EOF 
}


