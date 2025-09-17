resource "aws_elb" "North_Virginia-ELB" {
  provider = aws.North_Virginia
  name            = "flask-clb"
  subnets         = [aws_subnet.North_Virginia-Private-Subnet-1.id]   # public, IGW-routed
  security_groups = [aws_security_group.elb_sg.id]

  cross_zone_load_balancing = true

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 5000               # your app port on instances
    instance_protocol = "http"
  }

  health_check {
    target              = "HTTP:5000/health"  # ensure your app serves this
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 15
    timeout             = 5
  }

  # Register your two private instances
  instances = [
    aws_instance.North_Virginia-Private1-VM.id,
    aws_instance.North_Virginia-Private2-VM.id
  ]
}
