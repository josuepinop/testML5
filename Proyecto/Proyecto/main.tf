
provider "aws" {
region = "us-east-1"
}

resource "aws_security_group" "web" {
name        = "Examen3"
description = "Security group para permitir SSH y HTTP"

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
    cidr_blocks =["0.0.0.0/0"]

}

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks =["0.0.0.0/0"]

}
}

resource "aws_instance" "Examen3" {
ami             ="ami-0866a3c8686eaeeba"
instance_type   = "t2.micro"
security_groups = [aws_security_group.web.name]
key_name        = "instancia"

tags    ={
    Name = "Examen3instance"
}
}
