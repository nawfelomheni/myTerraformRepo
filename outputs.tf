output "myModuleInstanceArn" {
  value = aws_instance.myModuleInstance.*.arn
}
output "myModuleSecName" {
  value = aws_security_group.myModuleSecGroup.name
}
