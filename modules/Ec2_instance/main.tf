resource "aws_instance" "example" {
  ami                    = var.ami
  instance_type          = var.instance-type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = var.security_groups

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = var.tag_name
  }

  user_data = base64encode(file(var.user_data))

  associate_public_ip_address = true

  # Show real-time progress using provisioner
  provisioner "remote-exec" {
    inline = [
      # Check Docker installation
      "echo '=== Checking Docker Installation Status ==='",
      "docker --version || echo 'Docker not installed yet'",
      "while ! docker --version > /dev/null 2>&1; do sleep 5; echo 'Waiting for Docker...'; done",
      "echo '=== Docker successfully installed ==='",

      # Check image pulled
      "echo '=== Checking for Docker Image ==='",
      "while ! sudo docker image ls | grep -q shridhar71/weatherapp; do sleep 60; echo 'Waiting for Docker image to be pulled...'; done",
      "echo '=== Docker image successfully pulled ==='",

      # Check container running
      "echo '=== Checking for Running Container ==='",
      "while ! sudo docker ps | grep -q weatherapp; do sleep 5; echo 'Waiting for weatherapp container to start...'; done",
      "echo '=== Docker container successfully running on port 3000 ==='",
      "sudo docker ps | grep weatherapp",
      "echo '=== Deployment complete! Access your app ==='"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_k)
      host        = self.public_ip
    }
  }
}
