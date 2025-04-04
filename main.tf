provider "aws" {
  region = "us-east-1"
}

# Example of how to use the module
module "Ec2_instance" {
  source          = "./modules/Ec2_instance"   # path to the module
  ami             = "ami-0c55b159cbfafe1f0"    #  Instance ID of the AMI to use
  instance-type   = "t2.micro"                 # Instance type
  subnet_id       = "subnet-0bb1c79de3EXAMPLE" # ID of the subnet to launch the instance in
  key_name        = "my-key-pair"              # name of the key pair for SSH access
  security_groups = ["sg-0bb1c79de3EXAMPLE"]   # list of security group IDs to associate with the instance
  volume_size     = 8                          # size of the root volume in GB
  volume_type     = "gp3"                      # type of the root volume
  tag_name        = "MyInstance"               # name of the instance
  private_k       = "path/to/private/key.pem"  # path to the private key
  user_data       = "${path.module}/../../user_data.sh"     # user data script for install custom software
}

