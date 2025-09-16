variable "aws_access_key_id" {
  description = "Access Key" 
  type = string
  default = ""
}

variable "aws_secret_access_key" {
  description = "Secret Key" 
  type = string
  default = ""
}

variable "aws_session_token" {
  description = "Session Token" 
  type = string
  default = ""
}

variable "name-prefix" {
  description = "Name Prefix"
  type = string
  default = "North_Virginia"
}

variable "ami" {
  description = "AMI For Region North_Virginia"
  type = string
  default = "ami-0bbdd8c17ed981ef9" # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
}

variable "vm-size" {
  description = "VM Size"
  type = string
  default = "t3.small"
}

variable "vpc-cidr" {
  description = "VPC Cidr"
  type = string
  default = "10.10.0.0/16"
}

variable "vpc-public-subnet-1" {
  description = "VPC Public Subnet 1"
  type = string
  default = "10.10.1.0/24"
}

variable "vpc-private-subnet-1" {
  description = "VPC Private Subnet 1"
  type = string
  default = "10.10.2.0/24"
}

variable "vpc-private-subnet-2" {
  description = "VPC Private Subnet 2"
  type = string
  default = "10.10.3.0/24"
}