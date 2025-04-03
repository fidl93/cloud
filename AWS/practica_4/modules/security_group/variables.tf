variable "name" {
  description = "The name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID to associate the security group with"
  type        = string
}
