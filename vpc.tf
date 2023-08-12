# Dominic VPC for his birthday
resource "aws_vpc" "DOM-VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "DOM-VPC"
  }
}

# Public subnets 
resource "aws_subnet" "dom-sub-1-public" {
  vpc_id     = aws_vpc.DOM-VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "dom-sub-1-public"
  }
}

# Public subnets 
resource "aws_subnet" "dom-sub-2-public" {
  vpc_id     = aws_vpc.DOM-VPC.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "dom-sub-2-public"
  }
}

# Private subnets 
resource "aws_subnet" "dom-sub-1-private" {
  vpc_id     = aws_vpc.DOM-VPC.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "dom-sub-1-private"
  }
}

# Private subnets 
resource "aws_subnet" "dom-sub-2-private" {
  vpc_id     = aws_vpc.DOM-VPC.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "dom-sub-2-private"
  }
}

# dom route table public
resource "aws_route_table" "dom-public-route" {
  vpc_id = aws_vpc.DOM-VPC.id
  tags   = {
    Name = "dom-public-route"
  }
}

# dom route table private
resource "aws_route_table" "dom-private-route" {
  vpc_id = aws_vpc.DOM-VPC.id
  tags   = {
    Name = "dom-private-route"
  }
}

# dom public sub association
resource "aws_route_table_association" "dom-public-route-assocaition-1" {
  subnet_id      = aws_subnet.dom-sub-1-public.id
  route_table_id = aws_route_table.dom-public-route.id
}

# dom public sub association
resource "aws_route_table_association" "dom-public-route-assocaition-2" {
  subnet_id      = aws_subnet.dom-sub-2-public.id
  route_table_id = aws_route_table.dom-public-route.id
}


# dom private sub association
resource "aws_route_table_association" "dom-private-route-assocaition-1" {
  subnet_id      = aws_subnet.dom-sub-1-private.id
  route_table_id = aws_route_table.dom-private-route.id
}

# dom private sub association
resource "aws_route_table_association" "dom-private-route-assocaition-2" {
  subnet_id      = aws_subnet.dom-sub-2-private.id
  route_table_id = aws_route_table.dom-private-route.id
}

# dom internet gateway 
resource "aws_internet_gateway" "dom-IGW" {
  vpc_id = aws_vpc.DOM-VPC.id

  tags = {
    Name = "dom-IGW"
  }
}

# dom IGW route
resource "aws_route" "dom-route" {
  route_table_id            = aws_route_table.dom-public-route.id
  gateway_id                = aws_internet_gateway.dom-IGW.id
  destination_cidr_block    = "0.0.0.0/0"
}