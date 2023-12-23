resource "aws_vpc" "main" {
  cidr_block           = "192.68.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev-vpc"
  }
}