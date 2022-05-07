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
      Name = "Trazler IGW"
  }
}

#********************************************************#

resource "aws_subnet" "PUBLIC-SUBNET-1a" {
  vpc_id = aws_vpc.VPC.id
  cidr_block = var.PUBLIC-SUBNET-1a-cidr-block
  availability_zone = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
      Name = "Trazler PUBLIC SUBNET 1a"
  }
}

#********************************************************#

resource "aws_subnet" "PUBLIC-SUBNET-1b" {
  vpc_id = aws_vpc.VPC.id
  cidr_block = var.PUBLIC-SUBNET-1b-cidr-block
  availability_zone = "eu-central-1b"
  map_public_ip_on_launch = true
  
  tags = {
      Name = "Trazler PUBLIC SUBNET 1b"
  }
}

#********************************************************#

resource "aws_subnet" "PUBLIC-SUBNET-1c" {
  vpc_id = aws_vpc.VPC.id
  cidr_block = var.PUBLIC-SUBNET-1c-cidr-block
  availability_zone = "eu-central-1c"
  map_public_ip_on_launch = true
  
  tags = {
      Name = "Trazler PUBLIC SUBNET 1c"
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

resource "aws_route_table_association" "PUBLIC-SUBNET-1b-ROUTE-TABLE-ASSOCIATION" {
  subnet_id = aws_subnet.PUBLIC-SUBNET-1b.id
  route_table_id = aws_route_table.PUBLIC-ROUTE-TABLE.id
}

#********************************************************#

resource "aws_route_table_association" "PUBLIC-SUBNET-1c-ROUTE-TABLE-ASSOCIATION" {
  subnet_id = aws_subnet.PUBLIC-SUBNET-1c.id
  route_table_id = aws_route_table.PUBLIC-ROUTE-TABLE.id
}

#********************************************************#

resource "aws_subnet" "PRIVATE-SUBNET-1a" {
  vpc_id = aws_vpc.VPC.id
  cidr_block = var.PRIVATE-SUBNET-1a-cidr-block
  availability_zone = "eu-central-1a"
  
  tags = {
      Name = "Trazler PRIVATE SUBNET 1a"
  }
}

#********************************************************#

resource "aws_subnet" "PRIVATE-SUBNET-1b" {
  vpc_id = aws_vpc.VPC.id
  cidr_block = var.PRIVATE-SUBNET-1b-cidr-block
  availability_zone = "eu-central-1b"
  
  tags = {
      Name = "Trazler PRIVATE SUBNET 1b"
  }
}

#********************************************************#

resource "aws_subnet" "PRIVATE-SUBNET-1c" {
  vpc_id = aws_vpc.VPC.id
  cidr_block = var.PRIVATE-SUBNET-1c-cidr-block
  availability_zone = "eu-central-1c"
  
  tags = {
      Name = "Trazler PRIVATE SUBNET 1c"
  }
}

#********************************************************#

resource "aws_eip" "NAT-EIP-1a" {
  vpc = true
  depends_on = [aws_internet_gateway.IGW]

  tags = {
    Name = "Trazler NAT EIP 1a"
  }
}

#********************************************************#

resource "aws_eip" "NAT-EIP-1b" {
  vpc = true
  depends_on = [aws_internet_gateway.IGW]

  tags = {
    Name = "Trazler NAT EIP 1b"
  }
}

#********************************************************#

resource "aws_eip" "NAT-EIP-1c" {
  vpc = true
  depends_on = [aws_internet_gateway.IGW]

  tags = {
    Name = "Trazler NAT EIP 1c"
  }
}

#********************************************************#

resource "aws_nat_gateway" "NAT-SUBNET-1a" {
    allocation_id = aws_eip.NAT-EIP-1a
    subnet_id = aws_subnet.PUBLIC-SUBNET-1a.id
    depends_on = [aws_internet_gateway.IGW]

  tags = {
    Name = "Trazler NAT on Public Subnet 1a"
  }
}

#********************************************************#

resource "aws_nat_gateway" "NAT-SUBNET-1b" {
    allocation_id = aws_eip.NAT-EIP-1b
    subnet_id = aws_subnet.PUBLIC-SUBNET-1b.id
    depends_on = [aws_internet_gateway.IGW]

  tags = {
    Name = "Trazler NAT on Public Subnet 1b"
  }
}

#********************************************************#

resource "aws_nat_gateway" "NAT-SUBNET-1c" {
    allocation_id = aws_eip.NAT-EIP-1c
    subnet_id = aws_subnet.PUBLIC-SUBNET-1c.id
    depends_on = [aws_internet_gateway.IGW]

  tags = {
    Name = "Trazler NAT on Public Subnet 1c"
  }
}

#********************************************************#

resource "aws_route_table" "PRIVATE-ROUTE-TABLE-1a" {
   vpc_id = aws_vpc.VPC.id

   route = {
     cidr_block = var.PRIVATE-SUBNET-1a-cidr-block
     nat_gateway_id = aws_nat_gateway.NAT-SUBNET-1a.id
     } 

    tags = {
        Name = "Trazler PRIVATE ROUTE TABLE 1a"
    }  
 }

#********************************************************#

resource "aws_route_table" "PRIVATE-ROUTE-TABLE-1b" {
   vpc_id = aws_vpc.VPC.id

   route = {
     cidr_block = var.PRIVATE-SUBNET-1b-cidr-block
     nat_gateway_id = aws_nat_gateway.NAT-SUBNET-1b.id
     } 

    tags = {
        Name = "Trazler PRIVATE ROUTE TABLE 1b"
    }  
 }

#********************************************************#

 resource "aws_route_table" "PRIVATE-ROUTE-TABLE-1c" {
   vpc_id = aws_vpc.VPC.id

   route = {
     cidr_block = var.PRIVATE-SUBNET-1c-cidr-block
     nat_gateway_id = aws_nat_gateway.NAT-SUBNET-1c.id
     } 

    tags = {
        Name = "Trazler PRIVATE ROUTE TABLE 1c"
    }  
 }

#********************************************************#

resource "aws_route_table_association" "PRIVATE-SUBNET-1a-ROUTE-TABLE-ASSOCIATION" {
  subnet_id = aws_subnet.PRIVATE-SUBNET-1a.id
  route_table_id = aws_route_table.PUBLIC-ROUTE-TABLE.id
}

#********************************************************#

resource "aws_route_table_association" "PRIVATE-SUBNET-1b-ROUTE-TABLE-ASSOCIATION" {
  subnet_id = aws_subnet.PRIVATE-SUBNET-1b.id
  route_table_id = aws_route_table.PUBLIC-ROUTE-TABLE.id
}

#********************************************************#

resource "aws_route_table_association" "PRIVATE-SUBNET-1c-ROUTE-TABLE-ASSOCIATION" {
  subnet_id = aws_subnet.PRIVATE-SUBNET-1c.id
  route_table_id = aws_route_table.PUBLIC-ROUTE-TABLE.id
}