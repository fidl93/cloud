resource "aws_db_instance" "mysql" {
  allocated_storage    = var.db_storage
  db_name              = var.db_name
  engine               = "mysql"
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = "admin"
  password             = var.password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  db_subnet_group_name = var.db_subnet_group_name
}
