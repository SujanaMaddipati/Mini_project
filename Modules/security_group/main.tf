resource "aws_security_group" "sg_for_eks" {
  name   = var.sg_name
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_block
    }

  }
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      to_port     = egress.value.to_port
      from_port   = egress.value.from_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_block
    }
  }
}
