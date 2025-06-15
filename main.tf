module "VPC" {
  source              = "./Modules/VPC"
  vpc-cidr            = var.vpc-cidr
  private-subnet-az   = var.private-subnet-az
  private-subnet-cidr = var.private-subnet-cidr
  public-subnet-cidr  = var.public-subnet-cidr
  pulic-subnet-az     = var.pulic-subnet-az
  subnet-count        = var.subner-count
}
module "IAM" {
  source         = "./Modules/IAM"
  node_role_name = var.node_role_name
  eks_role_name  = var.eks_role_name

}
module "security_group" {
  source        = "./Modules/security_group"
  sg_name       = var.sg_name
  egress_rules  = var.egress_rules
  ingress_rules = var.ingress_rules
  vpc_id        = module.VPC.miniproject_vpc_id

}
module "EKS" {
  source         = "./Modules/EKS"
  node_arn_role  = module.IAM.node_role_name
  arn_role       = module.IAM.eks_role_names
  cluster_name   = var.cluster_name
  security_group = [module.security_group.sg_id]
  node_grp_name  = var.node_grp_name
  disk_sizes     = var.disk_sizes
  instance_type  = var.instance_type
  private_subnet = module.VPC.miniproject_private_subnet_id
  public_subnet  = module.VPC.miniproject_public_subnet_id
}
