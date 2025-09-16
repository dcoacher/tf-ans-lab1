# North_Virginia VPC
resource "aws_vpc" "North_Virginia-VPC" {
  provider = aws.North_Virginia
  cidr_block = var.vpc-cidr

  tags = {
    Name = "${var.name-prefix}-VPC"
  }
}

# North_Virginia Public Subnet 1
resource "aws_subnet" "North_Virginia-Public-Subnet-1" {
  provider = aws.North_Virginia
  vpc_id     = aws_vpc.North_Virginia-VPC.id
  cidr_block = var.vpc-public-subnet-1
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name-prefix}-Public-Subnet1"
  }
}

# North_Virginia Public Subnet 2
resource "aws_subnet" "North_Virginia-Public-Subnet-2" {
  provider = aws.North_Virginia
  vpc_id     = aws_vpc.North_Virginia-VPC.id
  cidr_block = var.vpc-public-subnet-2
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name-prefix}-Public-Subnet2"
  }
}

# North_Virginia Private Subnet 1
resource "aws_subnet" "North_Virginia-Private-Subnet-1" {
  provider = aws.North_Virginia
  vpc_id     = aws_vpc.North_Virginia-VPC.id
  cidr_block = var.vpc-private-subnet-1

  tags = {
    Name = "${var.name-prefix}-Private-Subnet1"
  }
}

# North_Virginia IGW
resource "aws_internet_gateway" "North_Virginia-IGW" {
  provider = aws.North_Virginia
  vpc_id = aws_vpc.North_Virginia-VPC.id

  tags = {
    Name = "${var.name-prefix}-IGW"
  }
}

# North_Virginia Route Table
resource "aws_route_table" "North_Virginia-RT" {
  provider = aws.North_Virginia
  vpc_id = aws_vpc.North_Virginia-VPC.id

  tags = {
    Name = "${var.name-prefix}-RT"
  }
}

# North_Virginia Route
resource "aws_route" "North_Virginia-Route" {
  provider = aws.North_Virginia
  route_table_id            = aws_route_table.North_Virginia-RT.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.North_Virginia-IGW.id
}

# North_Virginia Route Table Association for Public Subnet 1
resource "aws_route_table_association" "Oregon-RTA-Public-Subnet-1" {
  provider = aws.North_Virginia
  subnet_id      = aws_subnet.North_Virginia-Public-Subnet-1.id
  route_table_id = aws_route_table.North_Virginia-RT.id
} 

# North_Virginia Route Table Association for Public Subnet 2
resource "aws_route_table_association" "Oregon-RTA-Public-Subnet-2" {
  provider = aws.North_Virginia
  subnet_id      = aws_subnet.North_Virginia-Public-Subnet-2.id
  route_table_id = aws_route_table.North_Virginia-RT.id
}

# # North_Virginia Route Table Association for Private Subnet 1
# resource "aws_route_table_association" "North_Virginia-Private-Subnet-1" {
#   provider = aws.North_Virginia
#   subnet_id      = aws_subnet.Oregon-Subnet-2.id
#   route_table_id = aws_route_table.Oregon-RT.id
# }