variable "cidr_block" {
  type = string
  description = "value of the CIDR block for the VPC"
}

variable "enable_dns_hostnames" {
  type = bool
  description = "enable DNS hostnames for the VPC"
}

variable "tags" {
  type = map(string)
  description = "tags for the VPC"
}
