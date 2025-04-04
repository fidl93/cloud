resource "aws_instance" "ec2" {
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name = "proupsa-ec2-key-pair"
  root_block_device {
    volume_size = 20
    delete_on_termination = true
  }
  user_data = <<-EOF
            #!/bin/bash
            sudo apt update
            sudo apt install -y mysql-client
            sudo apt install -y python3-virtualenv
            sudo apt install -y openjdk-8-jdk
            EOF

  subnet_id = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = var.security_group_ids
  tags = var.tags

}
