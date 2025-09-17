output "Public-VM-IP" {
    value = aws_instance.North_Virginia-Public1-VM.public_ip
}

output "Private1-VM-IP" {
    value = aws_instance.North_Virginia-Private1-VM.private_ip
}

output "Private2-VM-IP" {
    value = aws_instance.North_Virginia-Private2-VM.private_ip
}

output "ELB-DNS-Name" {
    value = aws_elb.North_Virginia-ELB.dns_name
}

output "Key-Pair" {
  value = file("${path.module}/KP.pem")
  sensitive = true
}