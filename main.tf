terraform {  
    required_providers {    
        aws = {      
            source  = "hashicorp/aws"      
            version = "~> 3.27"   
        }  
    }
    required_version = ">= 0.14.9"
}

locals {
  instance_type = "t2.micro"
}


provider "aws" {
      profile = "default"  
      region  = "eu-west-2"
}


resource "aws_security_group" "ubuntu" {
  name        = "ubuntu-security-group"
  description = "Allow HTTP, HTTPS and SSH traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform"
  }
}



resource "aws_key_pair" "ubuntu" {
  key_name   = "ubuntu"
  public_key = file("~/.ssh/id_rsa.pub")
}



resource "aws_instance" "ubuntu" {
  ami             = "ami-0015a39e4b7c0966f"  
  instance_type   = "t2.micro"

  tags = {
      Name = "polly ubuntu"  
  }

  #vpc_security_group_ids = [
  #  aws_security_group.ubuntu.id
  #]

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("key")
    host        = self.public_ip
  }
}
resource "null_resource" "remote-exec" {
 
#  provisioner "remote-exec" {
#    inline = [
#    "sudo apt update",
#    "sudo apt-get install -y apache2 openssh-server",
#    "sudo systemctl enable apache2",            
#    "sudo systemctl start  apache2"
#    ]
#  }

}

