variable "route_table_id" {
  description = "The ID of the route table"
  type        = string
}

variable "destination_cidr_block" {
  description = "The CIDR block of the route"
  type        = string
}

variable "gateway_id" {
  description = "The ID of the gateway"
  type        = string
}
