variable "vpc-cidr" {
  type        = string
  description = "vpc cidr block"

}

variable "public-subnet-cidr" {
  type        = list(string)
  description = "public subnet cidr block "

}
variable "pulic-subnet-az" {
  type        = list(string)
  description = "public az for public subnet"

}
variable "subnet-count" {
  type        = number
  description = "count no.of subnets"

}
variable "private-subnet-cidr" {
  type        = list(string)
  description = "private subnet cidr block"

}
variable "private-subnet-az" {
  type        = list(string)
  description = "private az for private subnet"

}

