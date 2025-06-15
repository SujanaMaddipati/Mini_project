resource "aws_eks_cluster" "miniproject_cluster" {
  name     = var.cluster_name
  role_arn = var.arn_role

  vpc_config {
    subnet_ids              = concat(var.private_subnet, var.public_subnet)
    security_group_ids      = var.security_group
    endpoint_private_access = false
    endpoint_public_access  = true
  }

  tags = {
    Name = "miniproject-eks"
  }
}
resource "aws_eks_node_group" "miniproject_node_group" {
  cluster_name    = aws_eks_cluster.miniproject_cluster.name
  node_group_name = var.node_grp_name
  node_role_arn   = var.node_arn_role
  subnet_ids      = var.private_subnet # you want pods to run in private subnets
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  instance_types = var.instance_type
  disk_size      = var.disk_sizes
}
