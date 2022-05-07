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

#********************************************************#

resource "aws_route_table" "PUBLIC-ROUTE-TABLE" {
   vpc_id = aws_vpc.VPC.id

   route = {
     cidr_block = "0.0.0.0/0"
     gateway_id = aws_internet_gateway.IGW.id
     } 

    tags = {
        Name = "Trazler PUBLIC ROUTE TABLE"
    }  
 }
 
#********************************************************#

resource "aws_route_table_association" "PUBLIC-SUBNET-1a-ROUTE-TABLE-ASSOCIATION" {
  subnet_id = aws_subnet.PUBLIC-SUBNET-1a.id
  route_table_id = aws_route_table.PUBLIC-ROUTE-TABLE.id
}

#********************************************************#

resource "aws_route_table_association" "PUBLIC-SUBNET-1a-ROUTE-TABLE-ASSOCIATION" {
  subnet_id = aws_subnet.PUBLIC-SUBNET-1b.id
  route_table_id = aws_route_table.PUBLIC-ROUTE-TABLE.id
}

#********************************************************#

resource "aws_route_table_association" "PUBLIC-SUBNET-1a-ROUTE-TABLE-ASSOCIATION" {
  subnet_id = aws_subnet.PUBLIC-SUBNET-1c.id
  route_table_id = aws_route_table.PUBLIC-ROUTE-TABLE.id
}


