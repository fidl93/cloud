resource "aws_vpc_security_group_ingress_rule" "ingress_rule" {
    security_group_id = var.security_group_id
    cidr_ipv4         = var.cidr_ipv4
    from_port         = var.port
    ip_protocol       = var.ip_protocol
    to_port           = var.port
}
