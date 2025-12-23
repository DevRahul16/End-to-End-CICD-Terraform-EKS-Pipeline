
resource "aws_eks_node_group" "node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "primary-node-group"
  node_role_arn   = "dummy"
  subnet_ids      = ["subnet-123"]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  instance_types = ["t2.micro"]
}
