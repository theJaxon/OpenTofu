resource "aws_vpc" "management" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.infra_env}_${var.project}_vpc"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.management.id

  tags = {
    Name = "${var.infra_env}_${var.project}_internet_gateway"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.management.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "${var.infra_env}_${var.project}_public_route_table"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.management.id
  map_public_ip_on_launch = true
  count                   = var.public_subnets_count
  cidr_block              = "10.0.${count.index * 2 + 1}.0/24"
  availability_zone       = element(var.availability_zones, count.index)
  tags = {
    Name  = "${var.infra_env}_${var.project}_public_10.0.${count.index * 2 + 1}.0_${element(var.availability_zones, count.index)}"
  }
}

resource "aws_route_table_association" "public_route_table_public_subnet_association" {
  count = var.public_subnets_count
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_subnet" "private_subnets" {
  vpc_id                  = aws_vpc.management.id
  map_public_ip_on_launch = false
  count                   = var.private_subnets_count
  cidr_block              = "10.0.${count.index * 2}.0/24"
  availability_zone       = element(var.availability_zones, count.index)
  tags = {
    Name  = "${var.infra_env}_private_10.0.${count.index * 2}.0_${element(var.availability_zones, count.index)}"
  }
}