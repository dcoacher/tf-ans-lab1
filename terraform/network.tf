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
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.name-prefix}-Public-Subnet1"
  }
}

# North_Virginia Private Subnet 1
resource "aws_subnet" "North_Virginia-Private-Subnet-1" {
  provider = aws.North_Virginia
  vpc_id     = aws_vpc.North_Virginia-VPC.id
  cidr_block = var.vpc-private-subnet-1
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.name-prefix}-Public-Subnet2"
  }
}

# North_Virginia Private Subnet 2
resource "aws_subnet" "North_Virginia-Private-Subnet-2" {
  provider = aws.North_Virginia
  vpc_id     = aws_vpc.North_Virginia-VPC.id
  cidr_block = var.vpc-private-subnet-2
  availability_zone = "us-east-1c"

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
resource "aws_route_table_association" "North_Virginia-RTA-Public-Subnet-1" {
  provider = aws.North_Virginia
  subnet_id      = aws_subnet.North_Virginia-Public-Subnet-1.id
  route_table_id = aws_route_table.North_Virginia-RT.id
} 

# North_Virginia Route Table Association for Private Subnet 1
resource "aws_route_table_association" "North_Virginia-RTA-Private-Subnet-1" {
  provider = aws.North_Virginia
  subnet_id      = aws_subnet.North_Virginia-Private-Subnet-1.id
  route_table_id = aws_route_table.North_Virginia-RT.id
}

# North_Virginia Route Table Association for Private Subnet 2
resource "aws_route_table_association" "North_Virginia-RTA-Private-Subnet-2" {
  provider = aws.North_Virginia
  subnet_id      = aws_subnet.North_Virginia-Private-Subnet-2.id
  route_table_id = aws_route_table.North_Virginia-RT.id
}

# resource "aws_elb" "North_Virginia-ELB" {
#   provider = aws.North_Virginia
#   name               = "ELB"
#   availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

#   access_logs {
#     bucket        = "foo"
#     bucket_prefix = "bar"
#     interval      = 60
#   }

#   listener {
#     instance_port     = 8000
#     instance_protocol = "http"
#     lb_port           = 80
#     lb_protocol       = "http"
#   }

#   listener {
#     instance_port      = 8000
#     instance_protocol  = "http"
#     lb_port            = 443
#     lb_protocol        = "https"
#     ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
#   }

#   health_check {
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 3
#     target              = "HTTP:8000/"
#     interval            = 30
#   }

#   instances                   = [aws_instance.North_Virginia-Private1-VM.id, aws_instance.North_Virginia-Private2-VM.id]
#   cross_zone_load_balancing   = true
#   idle_timeout                = 400
#   connection_draining         = true
#   connection_draining_timeout = 400

#   tags = {
#     Name = "${var.name-prefix}-ELB"
#   }
# }