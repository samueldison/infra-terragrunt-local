output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "openid_provider_arn" {
  value = aws_iam_openid_connect_provider.openid[0].arn
}