resource "aws_vpc" "VPC" {
 instance_tenancy     = "default"
 enable_dns_hostnames = true
  cidr_block          = var.vpc-cidr
  tags                = {
  Name                = "Trazler VPC"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.VPC.id

  tags = {
    "Name" = "Trazler IGW"
  }
}