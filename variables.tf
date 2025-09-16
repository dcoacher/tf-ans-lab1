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

variable "ami-region" {
  description = "AMI For Region North_Virginia"
  type = string
  default = ""
}

variable "vpc-cidr" {
  description = "VPC1 Cidr"
  type = string
  default = ""
}

variable "vpc-public-subnet-1" {
  description = "VPC Public Subnet 1"
  type = string
  default = ""
}

variable "vpc-public-subnet-2" {
  description = "VPC Public Subnet 2"
  type = string
  default = ""
}

variable "vpc-private-subnet-1" {
  description = "VPC Private Subnet 1"
  type = string
  default = ""
}