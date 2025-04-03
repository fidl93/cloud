variable "ami" {
  description = "The AMI to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to launch"
  type        = string
  default = "t2.micro"
}

variable "subnet_id" {
  description = "The subnet to launch the instance into"
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to assign to the instance"
  type        = list(string)
}

variable "tags" {
    description = "A map of tags to add to all resources"
    type        = map(string)
}
