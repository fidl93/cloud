output "id" {
    description = "Value of the VPC ID"
    value = aws_vpc.vpc.id
}

output "route_table_id" {
    description = "Value of the route table ID"
    value = aws_vpc.vpc.default_route_table_id
}

output "default_security_group_id" {
    description = "Value of the default security group ID"
    value = aws_vpc.vpc.default_security_group_id
}
