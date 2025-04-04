terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.92.0"
    }
  }
}

provider "aws" {
    region = "eu-west-1"
    default_tags {
    tags = var.tags
    }

}

module "vpc" {
    source = "./modules/vpc"
    cidr_block = var.cidr_block
    enable_dns_hostnames = var.enable_dns_hostnames
    tags = var.vpc_tags
}

#Mismo módulo 3 veces con diferentes variables
module "subnet1" {
    source = "./modules/subnet"
    vpc_id = module.vpc.id
    cidr_block = var.subnet1_cidr_block
    availability_zone = var.subnet1_availability_zone
}

module "subnet2" {
    source = "./modules/subnet"
    vpc_id = module.vpc.id
    cidr_block = var.subnet2_cidr_block
    availability_zone = var.subnet2_availability_zone
}

module "subnet3" {
    source = "./modules/subnet"
    vpc_id = module.vpc.id
    cidr_block = var.subnet3_cidr_block
    availability_zone = var.subnet3_availability_zone
}

module "internet_gateway" {
    source = "./modules/internet_gateway"
    vpc_id = module.vpc.id
    tags = {
        Name = "UPSA-IGW"
    }
}

module "internet_route_table" {
    source = "./modules/route_in_route_table"
    route_table_id = module.vpc.route_table_id
    destination_cidr_block = var.destination_cidr_block
    gateway_id = module.internet_gateway.id
}

module "private_route_table"{
    source = "./modules/route_table"
    vpc_id = module.vpc.id
    tags = var.route_table_tags
}

#Tambien podemos seguir incluyendo rescursos sin ser modulos
resource "aws_route_table_association" "second_subnet_association" {
    depends_on = [ module.private_route_table ] # No Obligatorio
    subnet_id      = module.subnet2.id
    route_table_id = module.private_route_table.id
}

resource "aws_route_table_association" "third_subnet_association" {
    depends_on = [ module.private_route_table ] # No Obligatorio
    subnet_id      = module.subnet3.id
    route_table_id = module.private_route_table.id
}

#Requerido por el módulo de RDS DB_SUBNET_GROUP
resource "aws_db_subnet_group" "db_subnet_group" {
    name       = "db_subnet_group"
    subnet_ids = [module.subnet2.id, module.subnet3.id]
}

module "mysql_database" {
    source = "./modules/RDS"
    db_storage = var.db_storage
    db_name = var.db_name
    instance_class = var.instance_class
    password = var.password
    db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
}

#Creación de Security Group para internet
module "internet_security_group" {
    source = "./modules/security_group"
    name = var.internet_sg_name
    vpc_id = module.vpc.id
}

#Creación de regla de entrada para el puerto 22(SSH)
module "ssh_security_rule" {
    source = "./modules/ingress_security_rule"
    security_group_id = module.internet_security_group.id
    cidr_ipv4 = var.ssh_cidr_ipv4
    port = var.ssh_port
    ip_protocol = var.ssh_ip_protocol
}
#Regla de salida a internet
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = module.internet_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

module "virtual_machine" {
    source = "./modules/EC2"
    ami = var.ami
    subnet_id = module.subnet1.id #La que tiene asignada la route_table con Internet Gateway
    security_group_ids = [module.internet_security_group.id, module.vpc.default_security_group_id] #Acceso a internet y acceso al resto de subnets
    tags = var.ec2_tags
}
