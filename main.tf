resource "aws_vpc" "vpc" {
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  cidr_block           = var.vpc-cidr

  tags = {
    Name = "Trazler vpc"
  }
}

#********************************************************#

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Trazler igw"
  }
}

#********************************************************#

resource "aws_subnet" "public-subnet-1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public-subnet-1a-cidr-block
  availability_zone       = var.az1a
  map_public_ip_on_launch = true

  tags = {
    Name = "Trazler public subnet 1a"
  }
}

#********************************************************#

resource "aws_subnet" "public-subnet-1b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public-subnet-1b-cidr-block
  availability_zone       = var.az1b
  map_public_ip_on_launch = true

  tags = {
    Name = "Trazler public subnet 1b"
  }
}

#********************************************************#

resource "aws_subnet" "public-subnet-1c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public-subnet-1c-cidr-block
  availability_zone       = var.az1c
  map_public_ip_on_launch = true

  tags = {
    Name = "Trazler public subnet 1c"
  }
}

#********************************************************#

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Trazler public route table"
  }
}

#********************************************************#

resource "aws_route_table_association" "public-subnet-1a-route-table-association" {
  subnet_id      = aws_subnet.public-subnet-1a.id
  route_table_id = aws_route_table.public-route-table.id
}

#********************************************************#

resource "aws_route_table_association" "public-subnet-1b-route-table-association" {
  subnet_id      = aws_subnet.public-subnet-1b.id
  route_table_id = aws_route_table.public-route-table.id
}

#********************************************************#

resource "aws_route_table_association" "public-subnet-1c-route-table-association" {
  subnet_id      = aws_subnet.public-subnet-1c.id
  route_table_id = aws_route_table.public-route-table.id
}

#********************************************************#

resource "aws_subnet" "private-subnet-1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private-subnet-1a-cidr-block
  availability_zone = var.az1a

  tags = {
    Name = "Trazler private subnet 1a"
  }
}

#********************************************************#

resource "aws_subnet" "private-subnet-1b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private-subnet-1b-cidr-block
  availability_zone = var.az1b

  tags = {
    Name = "Trazler private subnet 1b"
  }
}

#********************************************************#

resource "aws_subnet" "private-subnet-1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private-subnet-1c-cidr-block
  availability_zone = var.az1c

  tags = {
    Name = "Trazler private subnet 1c"
  }
}

#********************************************************#

resource "aws_eip" "nat-eip-1a" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "Trazler nat eip 1a"
  }
}

#********************************************************#

resource "aws_eip" "nat-eip-1b" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "Trazler nat eip 1b"
  }
}

#********************************************************#

resource "aws_eip" "nat-eip-1c" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "Trazler nat eip 1c"
  }
}

#********************************************************#

resource "aws_nat_gateway" "nat-subnet-1a" {
  allocation_id = aws_eip.nat-eip-1a
  subnet_id     = aws_subnet.public-subnet-1a.id
  depends_on    = [aws_internet_gateway.igw]

  tags = {
    Name = "Trazler nat on public subnet 1a"
  }
}

#********************************************************#

resource "aws_nat_gateway" "nat-subnet-1b" {
  allocation_id = aws_eip.nat-eip-1b
  subnet_id     = aws_subnet.public-subnet-1b.id
  depends_on    = [aws_internet_gateway.igw]

  tags = {
    Name = "Trazler nat on public subnet 1b"
  }
}

#********************************************************#

resource "aws_nat_gateway" "nat-subnet-1c" {
  allocation_id = aws_eip.nat-eip-1c
  subnet_id     = aws_subnet.public-subnet-1c.id
  depends_on    = [aws_internet_gateway.igw]

  tags = {
    Name = "Trazler nat on public subnet 1c"
  }
}

#********************************************************#

resource "aws_route_table" "private-route-table-1a" {
  vpc_id = aws_vpc.vpc.id

  route = {
    cidr_block     = var.private-subnet-1a-cidr-block
    nat_gateway_id = aws_nat_gateway.nat-subnet-1a.id
  }

  tags = {
    Name = "Trazler private route table 1a"
  }
}

#********************************************************#

resource "aws_route_table" "private-route-table-1b" {
  vpc_id = aws_vpc.vpc.id

  route = {
    cidr_block     = var.private-subnet-1b-cidr-block
    nat_gateway_id = aws_nat_gateway.nat-subnet-1b.id
  }

  tags = {
    Name = "Trazler private route table 1b"
  }
}

#********************************************************#

resource "aws_route_table" "private-route-table-1c" {
  vpc_id = aws_vpc.vpc.id

  route = {
    cidr_block     = var.private-subnet-1c-cidr-block
    nat_gateway_id = aws_nat_gateway.nat-subnet-1c.id
  }

  tags = {
    Name = "Trazler private route table 1c"
  }
}

#********************************************************#

resource "aws_route_table_association" "private-subnet-1a-route-table-association" {
  subnet_id      = aws_subnet.private-subnet-1a.id
  route_table_id = aws_route_table.public-route-table.id
}

#********************************************************#

resource "aws_route_table_association" "private-subnet-1b-route-table-association" {
  subnet_id      = aws_subnet.private-subnet-1b.id
  route_table_id = aws_route_table.public-route-table.id
}

#********************************************************#

resource "aws_route_table_association" "private-subnet-1c-route-table-association" {
  subnet_id      = aws_subnet.private-subnet-1c.id
  route_table_id = aws_route_table.public-route-table.id
}
