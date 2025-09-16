# SG for North_Virginia
resource "aws_security_group" "Allow-HTTP-SSH" {
  provider = aws.North_Virginia
  name        = "Allow-HTTP-SSH"
  description = "Allow-HTTP-SSH"
  vpc_id      = aws_vpc.North_Virginia-VPC.id

  tags = {
    Name = "Allow-HTTP-SSH"
  }
}

# Inbound Rule for North_Virginia
resource "aws_vpc_security_group_ingress_rule" "Allow-Inbound-HTTP" {
  provider = aws.North_Virginia
  security_group_id = aws_security_group.Allow-HTTP-SSH.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# Inbound Rule for North_Virginia
resource "aws_vpc_security_group_ingress_rule" "Allow-Inbound-SSH" {
  provider = aws.North_Virginia
  security_group_id = aws_security_group.Allow-HTTP-SSH.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# Outbound Rule for North_Virginia
resource "aws_vpc_security_group_egress_rule" "Allow-Outbound-Any" {
  provider = aws.North_Virginia
  security_group_id = aws_security_group.Allow-HTTP-SSH.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}