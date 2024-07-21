resource "aws_instance" "web" {
  ami           = "ami-0ec0e125bb6c6e8ec"
  instance_type = "t2.micro"
  key_name      = "test"
  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.myenic.id
  }

  tags = {
    Name = "HelloWorld"
  }
}