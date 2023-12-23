variable "env" {
  description = "Environment name."
  type = string
}

variable "eks_version" {
  description = "EKS Version"
  type = string
}

variable "eks_name" {
  description = "Name of cluster"
  type = string
}

variable "subnet_ids" {
  description = "List of subnet IDs."
  type = list(string)
}

variable "node_iam_policies" {
  description = "IAM policies to attache to worker nodes."
  type = map(any)
  default = {
    1 = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    2 = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    3 = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  }
}  

variable "node_groups" {
  description = "EKS node groups"
  type = map(any)
}

variable "enable_oidc" {
  description = "Create OIDC provider for EKS cluster"
  type = bool
  default = true
}

variable "ec2_ssh_key" {
  type = string
}

variable "disk_size" {
  type = string
}

variable "source_security_group_ids" {
  type = list(string)
}