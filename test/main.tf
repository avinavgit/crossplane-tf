provider "aws" {
region = var.location
   shared_credentials_file = "aws-credentials"
   profile                 = "default"
}
resource "aws_security_group" "allow_tls" {
name        = "allow_tls"
description = "Allow TLS inbound traffic"
vpc_id      = var.vpc_id

ingress {
  description      = "TLS from VPC"
  from_port        = 443
  to_port          = 443
  protocol         = "tcp"
  cidr_blocks      = ["10.0.0.0/8"]

}

egress {
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]

}

tags = {
  Name = "allow_tls_crossplane"
}
}

variable location {
}

variable vpc_id {
}
