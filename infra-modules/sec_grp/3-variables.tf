variable "vpc_id" {
  type = string
}

variable "ingress" {
  type = list(string)
}

variable "cidr_blocks" {
  type = list(string)
}

variable "env" {
  type = string
}