variable "myInstanceType" {
  default = "t2.micro"
}
variable "myInstanceAmi" {
  default = "ami-093fa4c538885becf"
}
variable "numberOfInstances" {
  type = number
}
