# North_Virginia VPC
resource "aws_vpc" "North_Virginia-VPC" {
  provider = aws.North_Virginia
  cidr_block = var.vpc-cidr

  tags = {
    Name = "${var.name-prefix}-VPC2"
  }
}