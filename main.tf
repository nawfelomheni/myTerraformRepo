provider "aws" {
  region = "eu-west-3"
  version = "~> 3.2.0"
}

resource "aws_instance" "myStandardInstance" {
  count =var.numberOfInstances
  ami = var.myInstanceAmi
  instance_type = var.myInstanceType
  availability_zone = var.myPrincipaleAwsAZ
  subnet_id = var.mySubnetId
  key_name = var.myInstanceKeyName
  security_groups = [aws_security_group.myInstanceSecGroup.name]

  tags = {
    name = "myTerraformInstance-${count.index}"
    owner = "lilouch"
  }
}
resource "aws_security_group" "myInstanceSecGroup" {
  name = "myTerraformInstanceSecGroup"
  vpc_id = var.myVPCId
  ingress {
    from_port = 22
    protocol = "TCP"
    to_port = 22
    cidr_blocks = ["37.171.46.216/32"]
  }
  egress {
    from_port = 0
    protocol = "TCP"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "myInstancceId" {
  value = aws_instance.myStandardInstance
}