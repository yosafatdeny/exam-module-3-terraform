resource "aws_lb" "loadbalancer" {
  name               = "exam-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-lb-http.id]
  subnets            = [aws_subnet.subnet-1.id, aws_subnet.subnet-2.id, aws_subnet.subnet-3.id ]

  enable_deletion_protection = false
  tags = {
    Environment = "production"
  }
}


resource "aws_lb_target_group" "tg-exam-lb" {
  name     = "tg-exam-lb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.exam-vpc.id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-exam-lb.arn
  }
}

resource "aws_lb_target_group_attachment" "vm-ubuntu" {
  target_group_arn = aws_lb_target_group.tg-exam-lb.arn
  target_id        = module.instance-ubuntu.instance-ubuntu_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "vm-redhat" {
  target_group_arn = aws_lb_target_group.tg-exam-lb.arn
  target_id        = module.instance-redhat.instance-redhat_id
  port             = 80
}
