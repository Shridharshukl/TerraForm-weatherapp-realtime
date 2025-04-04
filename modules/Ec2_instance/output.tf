output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.example.public_ip
}

output "private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.example.private_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.example.id
}

output "key_name" {
  description = "Key name of the EC2 instance"
  value       = aws_instance.example.key_name
}