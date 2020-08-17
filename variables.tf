variable "myPrincipaleAwsAZ" {
  default = "eu-west-3c"
}
variable "myInstanceType" {
  default = "t2.micro"
}
variable "myInstanceAmi" {
  default = "ami-093fa4c538885becf"
}
variable "mySubnetId" {
  description = "The Id of the subnet where the Instance will launched"
}
variable "myVPCId" {
  description = "The Id of the VPC where the Instance will launched"
}
variable "numberOfInstances" {
  description = "The number of instances to launch"
}
variable "myInstanceKeyName" {

}
