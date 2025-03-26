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
