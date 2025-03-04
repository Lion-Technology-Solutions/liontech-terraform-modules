provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "rancher_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.rancher_sg.id]
  user_data              = file("${path.module}/user-data.sh")

  tags = {
    Name = "Rancher-Server"
  }
}

resource "aws_security_group" "rancher_sg" {
  name        = "rancher-security-group"
  description = "Allow HTTP, HTTPS, and SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# output "rancher_server_public_ip" {
#   value = aws_instance.rancher_server.public_ip
# }