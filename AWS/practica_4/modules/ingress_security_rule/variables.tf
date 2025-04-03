variable "security_group_id" {
    description = "ID of the security group to which the ingress rule will be applied"
    type        = string
}

variable "cidr_ipv4" {
    description = "value of the CIDR IPv4 to allow input connections"
    type        = string
}

variable "port" {
  description = "value of the port to allow input connections"
  type        = number
}

variable "ip_protocol" {
  description = "value of the ip protocol to allow input connections"
  type        = string
}
