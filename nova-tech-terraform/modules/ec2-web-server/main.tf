# EC2 Instance Module

resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name = var.key_name
  count = var.num
  iam_instance_profile = var.instance_profile_name

  associate_public_ip_address = true

  # user_data = <<-EOF
  #               #!/bin/bash
  #               apt update -y
  #               apt install -y apache2
  #               systemctl start apache2
  #               systemctl enable apache2
  #               echo "<h1>Welcome to ${var.name} web server</h1>" > /var/www/html/index.html
  #           EOF

    provisioner "file" {
    source      = "${path.root}/scripts/bootstrap.sh"
    destination = "/home/ubuntu/bootstrap.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }



  provisioner "file" {
    source      = "${path.root}/app/server.js"
    destination = "/var/www/nova-tech/server.js"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  provisioner "file" {
    source      = "${path.root}/scripts/nginx.conf"
    destination = "/home/ubuntu/nginx.conf"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/bootstrap.sh",
      "sudo /home/ubuntu/bootstrap.sh",
      "sudo mv /home/ubuntu/nginx.conf /etc/nginx/sites-available/default",
      "sudo systemctl restart nginx",
      "node /var/www/nova-tech/server.js &"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  tags = {
    name = "${var.name}-server"
  }
}
