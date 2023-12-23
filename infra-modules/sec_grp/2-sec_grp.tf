resource "aws_security_group" "sec_grp" {
  name        = "allow_tls"
  description = "Allow SSH & HTTP inbound traffic"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = var.cidr_blocks
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
  }

  tags = {
    Name = "${var.env}-sec_grp"
  }
}