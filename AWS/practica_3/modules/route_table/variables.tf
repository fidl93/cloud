variable vpc_id {
  description = "The ID of the VPC"
  type        = string
}

variable tags {
  description = "A map of tags for the route table"
  type        = map(string)
}
