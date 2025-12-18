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


  # -----------------------------
  # Provisioner: remote-exec
  # -----------------------------
provisioner "remote-exec" {
  inline = [ 
    "sudo apt update -y",
      "sudo apt install -y apache2",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2",
      "echo '<h1>${var.project_name} - ${var.environment}</h1>' | sudo tee /var/www/html/index.html"
   ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
}

provisioner "file" {
  source      = "${path.module}/files/index.html"
  destination = "/home/ubuntu/index.html"

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }
}

provisioner "file" {
  source = "${path.module}/files/index.css"
  destination = "/home/ubuntu/index.css"

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }
}

provisioner "remote-exec" {
  inline = [
    "sudo mv /home/ubuntu/index.html /var/www/html/index.html",
     "sudo mv /home/ubuntu/index.css /var/www/html/index.css",
    "sudo systemctl restart apache2"
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
