#VPC
resource "aws_vpc" "main" {
  cidr_block       = "10.3.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  

  tags = {
    Name = "terraform vpc"
  }
  }

#INTERNET GATEWAY
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform_igw"
  }
}

#SUBNETS
resource "aws_subnet" "PUB1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.3.1.0/24"

  tags = {
    Name = "PUB1"
  }
}

resource "aws_subnet" "PUB2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.3.2.0/24"

  tags = {
    Name = "PUB2"
  }
}

resource "aws_subnet" "PRIV" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.3.3.0/24"

  tags = {
    Name = "PRIV"
  }
}

#ROUTE TABLE
resource "aws_route_table" "Public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Public"
  }
}

#PUBLIC SUBNET ASSOCIATION
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.PUB1.id
  route_table_id = aws_route_table.Public.id
}


