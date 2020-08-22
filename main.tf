provider "aws" {
  version = "~> 3.2.0"
  region  = "eu-west-3"
}


resource "aws_instance" "myModuleInstance" {
  count = var.numberOfInstances
  ami = var.myInstanceAmi
  instance_type = var.myInstanceType
  security_groups = [aws_security_group.myModuleSecGroup.name]
  tags = {
    Name = "myModuleInstance-${count.index}"
  }
}

resource "aws_default_vpc" "myDefaultVpc" {}
resource "aws_security_group" "myModuleSecGroup" {
  name = "myModuleSecGroup"
  vpc_id = aws_default_vpc.myDefaultVpc.id
}
resource "aws_security_group_rule" "myModuleRule" {
  from_port = 80
  protocol = "TCP"
  security_group_id = aws_security_group.myModuleSecGroup.id
  to_port = 80
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

