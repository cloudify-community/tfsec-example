output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.example_vm.id
}

output "instance_ip" {
  description = "IP address of the created EC2 instance"
  value       = aws_eip.eip.public_ip
}
