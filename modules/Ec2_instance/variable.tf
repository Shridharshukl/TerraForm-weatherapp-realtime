variable "instance-type" {
  description = "Type of instance"
  type = string
}
variable "ami" {
    description = "AMI ID"
    type = string
}
variable "subnet_id" {
    description = "Subnet ID"
    type = string
}
variable "key_name" {
    description = "Key name"
    type = string
}
variable "security_groups" {
    description = "Security groups"
    type = list(string)
}
variable "volume_size" {
    description = "Volume size"
    type = number
}
variable "volume_type" {
    description = "Volume type"
    type = string
}
variable "tag_name" {
    description = "Tag name"
    type = string
}
variable "private_k" {
  description = "Private key location" 
  type = string 
}
variable "user_data" {
  description = "User data script"
  type        = string
}