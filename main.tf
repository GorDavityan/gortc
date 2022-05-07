resource "aws_vpc" "VPC" {
 instance_tenancy     = "default"
 enable_dns_hostnames = true
  cidr_block          = var.vpc-cidr

  tags                = {
  Name                = "Trazler VPC"
  }
}

#********************************************************#

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.VPC.id

  tags = {
    "Name" = "Trazler IGW"
  }
}

#********************************************************#

resource "aws_subnet" "PUBLIC-SUBNET-1a" {
  vpc_id = aws_vpc.VPC.id
  cidr_block = var.PUBLIC-SUBNET-1a-cidr-block
  availability_zone = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
      Name = "Trazler PUBLIC-SUBNET-1a"
  }
}

#********************************************************#

resource "aws_subnet" "PUBLIC-SUBNET-1b" {
  vpc_id = aws_vpc.VPC.id
  cidr_block = var.PUBLIC-SUBNET-1b-cidr-block
  availability_zone = "eu-central-1b"
  map_public_ip_on_launch = true
  
  tags = {
      Name = "Trazler PUBLIC-SUBNET-1b"
  }
}

#********************************************************#

resource "aws_subnet" "PUBLIC-SUBNET-1c" {
  vpc_id = aws_vpc.VPC.id
  cidr_block = var.PUBLIC-SUBNET-1c-cidr-block
  availability_zone = "eu-central-1c"
  map_public_ip_on_launch = true
  
  tags = {
      Name = "Trazler PUBLIC-SUBNET-1c"
  }
}