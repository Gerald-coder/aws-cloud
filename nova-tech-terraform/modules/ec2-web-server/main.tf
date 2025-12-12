# EC2 Instance Module

resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name = var.key_name
  count = var.count

  associate_public_ip_address = true

  user_data = <<-EOF
                #!/bin/bash
                apt update -y
                apt install -y apache2
                systemctl start apache2
                systemctl enable apache2
                echo "<h1>Welcome to ${var.name} web server</h1>" > /var/www/html/index.html
            EOF
  tags = {
    name = "${var.name}-server"
  }
}