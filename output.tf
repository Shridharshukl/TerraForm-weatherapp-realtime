output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.Ec2_instance.public_ip
}

output "instance_private_key" {
  description = "Private key name of the EC2 instance"
  value       = module.Ec2_instance.key_name
}
