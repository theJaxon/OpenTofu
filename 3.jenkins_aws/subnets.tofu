resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.management.id
  map_public_ip_on_launch = true
  count                   = var.public_subnets_count
  cidr_block              = "10.0.${count.index * 2 + 1}.0/24"
  availability_zone       = element(var.availability_zones, count.index)
  tags = {
    Name  = "public_10.0.${count.index * 2 + 1}.0_${element(var.availability_zones, count.index)}"
    Owner = var.owner
  }
}

resource "aws_subnet" "private_subnets" {
  vpc_id                  = aws_vpc.management.id
  map_public_ip_on_launch = false
  count                   = var.private_subnets_count
  cidr_block              = "10.0.${count.index * 2}.0/24"
  availability_zone       = element(var.availability_zones, count.index)
  tags = {
    Name  = "private_10.0.${count.index * 2}.0_${element(var.availability_zones, count.index)}"
    Owner = var.owner
  }
}