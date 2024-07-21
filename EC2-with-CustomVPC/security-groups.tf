####################################
#Security Group#
######################################

resource "aws_security_group" "mysg" {
  name        = "my-sg"
  description = "allow ports ssh http tcp"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "Allow HTTP"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow HTTPs"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow SSH"
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
    name = "security groups"
  }

  depends_on = [aws_vpc.myvpc]

}