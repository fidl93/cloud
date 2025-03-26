resource "aws_internet_gateway" "internet_gw" {
  vpc_id = var.vpc_id
  tags = var.tags
}
