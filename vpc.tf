resource "aws_vpc" "demo_vpc" {
  tags = {
    Name = "tf-vpc"
  }
  cidr_block = "192.168.100.0/24"
  instance_tenancy = "default"
  enable_dns_hostnames = true
}

resource "aws_subnet" "demo_subnet_public1" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "tf-vpc-public1"
  }
  availability_zone = "ap-south-1a"
  cidr_block = "192.168.100.0/26"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "demo_subnet_public2" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "tf-vpc-public2"
  }
  availability_zone = "ap-south-1b"
  cidr_block = "192.168.100.64/26"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "demo_subnet_private1" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "tf-vpc-private1"
  }
  availability_zone = "ap-south-1a"
  cidr_block = "192.168.100.128/26"
}

resource "aws_subnet" "demo_subnet_private2" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "tf-vpc-private2"
  }
  availability_zone = "ap-south-1b"
  cidr_block = "192.168.100.192/26"
}

resource "aws_internet_gateway" "demo_igw" {
  tags = {
    Name = "tf-vpc-igw"
  }
  vpc_id = aws_vpc.demo_vpc.id
}

resource "aws_default_route_table" "demo_default_rt" {
  default_route_table_id = aws_vpc.demo_vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id
  }
  tags = {
    Name = "tf-vpc-main-rt"
  }
}

resource "aws_route_table" "demo_private_rt" {
  tags = {
    Name = "tf-vpc-private-rt"
  }
  vpc_id = aws_vpc.demo_vpc.id
}

resource "aws_route_table_association" "associate_private1" {
  subnet_id      = aws_subnet.demo_subnet_private1.id
  route_table_id = aws_route_table.demo_private_rt.id
}

resource "aws_route_table_association" "associate_private2" {
  subnet_id      = aws_subnet.demo_subnet_private2.id
  route_table_id = aws_route_table.demo_private_rt.id
}