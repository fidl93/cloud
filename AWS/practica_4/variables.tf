####### AWS Global #######
variable "tags" {
  description = "A map of tags for all AWS components"
  type        = map(string)
  default     = {
    ENV     = "CERT"
    PROJECT = "UPSA"
  }
}
####### VPC #######
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default       = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "A map of tags for the VPC"
  type        = map(string)
  default     = {
    Name    = "UPSA-VPC"
  }
}

####### Subnet 1 #######
variable "subnet1_cidr_block" {
  description = "The CIDR block for the subnet 1"
  type        = string
  default = "10.0.1.0/24"
}

variable "subnet1_availability_zone" {
  description = "The availability zone for the subnet 1"
  type        = string
  default     = "eu-west-1a"
}

####### Subnet 2 #######
variable "subnet2_cidr_block" {
  description = "Value of the subnet2_cidr_block"
  type        = string
  default = "10.0.2.0/24"
}

variable "subnet2_availability_zone" {
  description = "Value of the subnet2_availability_zone"
  type        = string
  default     = "eu-west-1b"
}

####### Subnet 3 #######
variable "subnet3_cidr_block" {
  description = "Value of the subnet3_cidr_block"
  type        = string
  default = "10.0.3.0/24"
}

variable "subnet3_availability_zone" {
  description = "Value of the subnet3_availability_zone"
  type        = string
  default     = "eu-west-1c"
}

####### Internet route table #######
variable "destination_cidr_block" {
  description = "The CIDR block of the destination for route"
  type        = string
  default = "0.0.0.0/0"
}

####### private_route_table #######
variable "route_table_tags" {
  description = "A map of tags for the route table"
  type        = map(string)
  default     = {
    Name    = "private-route-table"
  }
}

####### Mysql RDS #######
variable "db_storage" {
  description = "The amount of storage to allocate for the database"
  type        = number
  default     = 10
}
variable "db_name" {
  description = "The name of the database to create"
  type        = string
  default = "UPSA"
}

variable "instance_class" {
  description = "The instance class to use"
  type        = string
  default     = "db.t3.micro"
}

variable "password" {
  description = "The password for the database user"
  type        = string
  sensitive = true
  default = "Pa55w.rd1234"
}
####### Internet Security Group #######
variable "internet_sg_name" {
  description = "The name of the security group"
  type        = string
  default     = "UPSA-INTERNET-SG"
}

####### EC2 VM #######
variable "ami" {
  description = "The AMI to use for the EC2 instance"
  type        = string
  default = "ami-0a007a006645e86ab"
}

variable "ec2_tags" {
    description = "A map of tags to add to all resources"
    type        = map(string)
    default     = {
        Name = "UPSA-EC2"
    }
}
