# North_Virginia Public 1 VM
resource "aws_instance" "North_Virginia-Public1-VM" {
  provider = aws.North_Virginia
  ami           = var.ami
  instance_type = var.vm-size
#   key_name = aws_key_pair.OregonKey.key_name
  vpc_security_group_ids = [aws_security_group.Allow-HTTP-SSH.id]
  subnet_id = aws_subnet.North_Virginia-Public-Subnet-1.id
  
  tags = {
    Name = "${var.name-prefix}-Public1-VM"
  }
}

# North_Virginia Private 1 VM
resource "aws_instance" "North_Virginia-Private1-VM" {
  provider = aws.North_Virginia
  ami           = var.ami
  instance_type = var.vm-size
#   key_name = aws_key_pair.OregonKey.key_name
  vpc_security_group_ids = [aws_security_group.Allow-HTTP-SSH.id]
  subnet_id = aws_subnet.North_Virginia-Private-Subnet-1.id
  private_ip = "10.10.2.10"
  
  tags = {
    Name = "${var.name-prefix}-Private1-VM"
  }
}

# North_Virginia Private 2 VM
resource "aws_instance" "North_Virginia-Private2-VM" {
  provider = aws.North_Virginia
  ami           = var.ami
  instance_type = var.vm-size
#   key_name = aws_key_pair.OregonKey.key_name
  vpc_security_group_ids = [aws_security_group.Allow-HTTP-SSH.id]
  subnet_id = aws_subnet.North_Virginia-Private-Subnet-2.id
  private_ip = "10.10.3.10"
  
  tags = {
    Name = "${var.name-prefix}-Private2-VM"
  }
}