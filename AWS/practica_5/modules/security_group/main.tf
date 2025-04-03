resource "aws_security_group" "sg" {
  name        = var.name
  vpc_id      = var.vpc_id
}
