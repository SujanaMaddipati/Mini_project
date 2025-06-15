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
variable "vpc_id" {
  type = string

}
