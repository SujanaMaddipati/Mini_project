output "vpc_id" {
  value = module.VPC.miniproject_vpc_id

}
output "security_group" {
  value = module.security_group.sg_id

}
output "allocation_id" {
  value = module.VPC.miniproject_allocation_id

}
