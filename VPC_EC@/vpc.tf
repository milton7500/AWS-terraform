provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_route_table" "name" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_internet_gateway" "myig" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_subnet" "private-subnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
}


