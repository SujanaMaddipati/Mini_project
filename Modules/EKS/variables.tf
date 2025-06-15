variable "public_subnet" {
  type = list(string)

}
variable "private_subnet" {
  type = list(string)

}
variable "security_group" {
  type = list(string)
}
variable "cluster_name" {
  type = string

}
variable "arn_role" {
  type = string

}
variable "node_grp_name" {
  type = string

}
variable "node_arn_role" {
  type = string

}
variable "instance_type" {
  type = list(string)

}
variable "disk_sizes" {
  type = number
}

