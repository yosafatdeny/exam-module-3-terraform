resource "aws_security_group" "open-ssh" {
  name        = "open-ssh"
  description = "sg for ssh"
  vpc_id      = aws_vpc.exam-vpc.id

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "open-ssh"
  }
}

resource "aws_security_group" "open-http" {
  name        = "open-http"
  description = "sg for http"
  vpc_id      = aws_vpc.exam-vpc.id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "open-http"
  }
}

resource "aws_security_group" "sg-lb-http" {
  name        = "sg-lb-http"
  description = "sg lb for http"
  vpc_id      = aws_vpc.exam-vpc.id

  ingress {
    description = "http lb"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-lb-http"
  }
}