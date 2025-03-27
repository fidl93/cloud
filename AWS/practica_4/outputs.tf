output "vpc_id" {
    description = "The ID of the VPC"
    value       = module.vpc.id
}

output "mysql_endpoint" {
    description = "The endpoint of the MySQL RDS instance"
    value       = module.mysql_database.endpoint
}

output "virtual_machine_endpoint" {
    description = "The endpoint of the virtual machine"
    value       = module.virtual_machine.public_dns
}
