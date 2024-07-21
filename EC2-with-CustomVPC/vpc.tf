provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "myvpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "testing-vpc"
  }
}

resource "aws_internet_gateway" "mygw" {
  vpc_id     = aws_vpc.myvpc.id
  depends_on = [aws_vpc.myvpc]
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
  depends_on              = [aws_vpc.myvpc]
}

resource "aws_route_table" "my_vpc_routable" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mygw.id
  }

  depends_on = [aws_vpc.myvpc, aws_internet_gateway.mygw]
}

resource "aws_route_table_association" "associate_with_subent" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.my_vpc_routable.id
}

/*resource "aws_subnet" "private_subne1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false
}*/