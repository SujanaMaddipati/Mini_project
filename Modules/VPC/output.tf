output "miniproject_vpc_id" {
  value = aws_vpc.miniproject_vpc.id

}
output "miniproject_public_subnet_id" {
  value = aws_subnet.miniproject_public_subnet[*].id

}
output "miniproject_private_subnet_id" {
  value = aws_subnet.miniproject_private_subnet[*].id

}
output "miniproject_allocation_id" {
  value = aws_nat_gateway.miniproject_NatGateway.allocation_id

}
