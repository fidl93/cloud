terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.92.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}
#Creacion de VPC (Route table creada por defecto)
resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true


  tags = {
    ENV     = "CERT"
    PROJECT = "UPSA"
    Name    = "UPSA-VPC"
  }
}
#Creacion de subredes
resource "aws_subnet" "first_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    ENV     = "CERT"
    PROJECT = "UPSA"
  }
}

resource "aws_subnet" "second_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    ENV     = "CERT"
    PROJECT = "UPSA"
  }
}

resource "aws_subnet" "third_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-1c"

  tags = {
    ENV     = "CERT"
    PROJECT = "UPSA"
  }
}
#Creacion de internet gateway
resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = "UPSA-IGW"
    ENV     = "CERT"
    PROJECT = "UPSA"
  }
}

#Añadimos una ruta a la route table, creada por defecto de la VPC, para que el tráfico salga a internet
resource "aws_route" "route_internet" {
  route_table_id            = aws_vpc.vpc.default_route_table_id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.internet_gw.id
}

#Segunda Arquitectura
# # Crear una tabla de rutas privada
# resource "aws_route_table" "private_route_table" {
#   vpc_id = aws_vpc.vpc.id

#   tags = {
#     Name    = "UPSA-Private-RT"
#     ENV     = "CERT"
#     PROJECT = "UPSA"
#   }
# }

# # Asociar la third_subnet con la tabla de rutas privada
# resource "aws_route_table_association" "third_subnet_association" {
#   subnet_id      = aws_subnet.third_subnet.id
#   route_table_id = aws_route_table.private_route_table.id
# }
