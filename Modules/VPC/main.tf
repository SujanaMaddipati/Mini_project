resource "aws_vpc" "miniproject_vpc" {
  cidr_block           = var.vpc-cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
}
resource "aws_subnet" "miniproject_public_subnet" {
  cidr_block        = var.public-subnet-cidr[count.index]
  vpc_id            = aws_vpc.miniproject_vpc.id
  depends_on        = [aws_vpc.miniproject_vpc]
  count             = var.subnet-count
  availability_zone = var.pulic-subnet-az[count.index]
}
resource "aws_subnet" "miniproject_private_subnet" {
  cidr_block        = var.private-subnet-cidr[count.index]
  availability_zone = var.private-subnet-az[count.index]
  vpc_id            = aws_vpc.miniproject_vpc.id
  count             = var.subnet-count
  depends_on        = [aws_vpc.miniproject_vpc]
}
resource "aws_nat_gateway" "miniproject_NatGateway" {
  allocation_id = aws_eip.nat_eip.id

  subnet_id  = aws_subnet.miniproject_public_subnet[0].id
  depends_on = [aws_subnet.miniproject_public_subnet]

}
resource "aws_eip" "nat_eip" {
  domain = "vpc"

}
resource "aws_route_table" "miniproject_routetable" {
  vpc_id = aws_vpc.miniproject_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.miniproject_NatGateway.id
  }
}

resource "aws_route_table_association" "route_assoc" {
  count          = var.subnet-count
  route_table_id = aws_route_table.miniproject_routetable.id
  subnet_id      = aws_subnet.miniproject_private_subnet[count.index].id

}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.miniproject_vpc.id


}
resource "aws_route_table" "igw_route" {
  vpc_id = aws_vpc.miniproject_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id

  }
}
resource "aws_route_table_association" "public_igw" {
  route_table_id = aws_route_table.igw_route.id
  subnet_id      = aws_subnet.miniproject_public_subnet[0].id

}
