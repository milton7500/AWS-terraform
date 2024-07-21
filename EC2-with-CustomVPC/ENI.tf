## Assign elastic ENI card to IP

resource "aws_network_interface" "myenic" {
  subnet_id       = aws_subnet.public_subnet.id
  private_ips     = ["10.0.0.10"]
  security_groups = [aws_security_group.mysg.id]
}

# Assign elstic IP to ENI

resource "aws_eip" "myeip" {
  domain                    = "vpc"
  associate_with_private_ip = "10.0.0.10"
  network_interface         = aws_network_interface.myenic.id
  depends_on                = [aws_internet_gateway.mygw, aws_network_interface.myenic]
}