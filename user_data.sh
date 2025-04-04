#!/bin/bash
# Update packages
sudo apt update -y

# Install Docker
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

# Add ubuntu user to docker group (optional)
sudo usermod -aG docker ubuntu

# Install AWS CLI (v2)
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip -y
unzip awscliv2.zip
sudo ./aws/install

# Clean up
rm -rf awscliv2.zip aws/

# pull and run the Docker image 
docker pull shridhar71/weatherapp:v1  

docker run -d -p 3000:3000 --name weatherapp shridhar71/weatherapp:v1

