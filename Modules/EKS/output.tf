output "cluster_id" {
  value = aws_eks_cluster.miniproject_cluster.id

}
output "node_id" {
  value = aws_eks_node_group.miniproject_node_group.id

}