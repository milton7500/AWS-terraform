resource "aws_security_group" "mysg" {
  name = "test-sg"
  vpc_id = aws_vpc.myvpc.id
  tags = {
    name = "Allow_all"
  }
}

resource "aws_security_group_rule" "ssh_access" {
  type = "ingress"
  security_group_id = aws_security_group.mysg.id
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere (adjust for specific IP ranges)
  description = "Allow SSH access"
}

resource "aws_security_group_rule" "http_egress" {
  type = "egress"
  security_group_id = aws_security_group.mysg.id
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"] # Allow outbound traffic to any destination (adjust for specific IP ranges)
  description = "Allow outbound HTTP traffic"
}

resource "aws_instance" "myec2" {
  ami = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  key_name = "test-key.pem"
}