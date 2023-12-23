data "tls_certificate" "cert" {
  count = var.enable_oidc ? 1 : 0 
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "openid" {
  count = var.enable_oidc ? 1 : 0

  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.cert[0].certificates[0].sha1_fingerprint]
}
