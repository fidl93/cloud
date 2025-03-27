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
