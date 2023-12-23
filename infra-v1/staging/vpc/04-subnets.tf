resource "aws_subnet" "private_us-east-1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.68.0.0/24"

  availability_zone = "us-east-1a"

  tags = {
    Name                                = "dev-private_us-east-1a"
    "kubernetes.io/cluster/dev-cluster" = "owned"
    "kubernetes.io/role/internal-elb"   = "1"
  }

}

resource "aws_subnet" "private_us-east-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.68.32.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name                                = "dev-private_us-east-1b"
    "kubernetes.io/cluster/dev-cluster" = "owned"
    "kubernetes.io/role/internal-elb"   = "1"
  }

}

resource "aws_subnet" "public_us-east-1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.68.16.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name                                = "dev-public_us-east-1a"
    "kubernetes.io/cluster/dev-cluster" = "owned"
    "kubernetes.io/role/elb"            = "1"
  }

}

resource "aws_subnet" "public_us-east-1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.68.48.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name                                = "dev-public_us-east-1b"
    "kubernetes.io/cluster/dev-cluster" = "owned"
    "kubernetes.io/role/elb"            = "1"
  }

}