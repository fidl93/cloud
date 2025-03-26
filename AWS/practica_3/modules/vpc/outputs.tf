output "id" {
    description = "Value of the VPC ID"
    value = aws_vpc.vpc.id
}

output "route_table_id" {
    description = "Value of the route table ID"
    value = aws_vpc.vpc.default_route_table_id
}
