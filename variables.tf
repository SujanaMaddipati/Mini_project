variable "vpc-cidr" {
  type = string
}
variable "public-subnet-cidr" {
  type = list(string)
}
variable "private-subnet-cidr" {
  type = list(string)
}
variable "pulic-subnet-az" {
  type = list(string)
}
variable "private-subnet-az" {
  type = list(string)
}
variable "subner-count" {
  type = number

}
variable "node_role_name" {
  type = string
}
variable "eks_role_name" {
  type = string

}
variable "sg_name" {
  type = string

}
variable "ingress_rules" {
  type = list(object({
    from_port  = number
    to_port    = number
    protocol   = string
    cidr_block = list(string)
  }))

}
variable "egress_rules" {
  type = list(object({
    from_port  = number
    to_port    = number
    protocol   = string
    cidr_block = list(string)
  }))

}
variable "cluster_name" {
  type = string

}
variable "node_grp_name" {
  type = string

}
variable "disk_sizes" {
  type = number

}
variable "instance_type" {
  type = list(string)

}
