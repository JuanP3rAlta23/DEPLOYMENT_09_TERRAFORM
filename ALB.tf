resource "aws_alb" "Deploy9ALB" {
  name               = "Deploy9ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_80.id]
  subnets            = [
      aws_subnet.Public01.id,
      aws_subnet.Public02.id
 ]

  enable_deletion_protection = true

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.bucket
#     prefix  = "Deploy9-lb"
#     enabled = true
#   }

  tags = {
    Environment = "production"
  }
}

resource "aws_security_group" "allow_80" {
  name        = "allow_80"
  description = "Allow port 80 for ALB"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "80 from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_80"
  }
}

resource "aws_alb_target_group" "tar_EC2" {
  name     = "tar_EC2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_target_group_attachment" "Attach_EC2" {
  target_group_arn = aws_alb_target_group.tar_EC2.arn
  target_id        = aws_instance.ec2.id
  port             = 80
}