output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnet_ids" {
  value = [aws_subnet.private_us-east-1a.id,
   aws_subnet.private_us-east-1b.id]
}


output "public_subnet_ids" {
  value = [aws_subnet.public_us-east-1a.id,
   aws_subnet.public_us-east-1b.id]
}
