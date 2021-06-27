provider "aws" {
    region = "us-west-2"
    profile =  //  pass here your aws profile
}

variable "vpcid" {
    type = string
    default =  //  pass here your vpc id 
}

resource "aws_security_group" "terraform_ec2_sg" {
  name        = "terraform_ec2_sg"
  description = "terraform course sg for ec2 instance"
  vpc_id      = "${var.vpcid}"

  ingress {
    description      = "SG from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]    
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "terraform_ec2_sg"
  }
}