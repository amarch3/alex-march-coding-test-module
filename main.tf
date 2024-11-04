provider "aws" {
  region = var.region
}

# Lookup the target default VPC
data "aws_vpc" "vpc" {
  filter {
    name   = "cidr"
    values = [var.vpc_cidr]
  }
}

# Lookup the target default public subnet
data "aws_subnet" "public_subnet" {
  filter {
    name   = "cidrBlock"
    values = [var.public_subnet_cidr]
  }
  vpc_id = data.aws_vpc.vpc.id
}

# Lookup the target default private subnet
data "aws_subnet" "private_subnet" {
  filter {
    name   = "cidrBlock"
    values = [var.private_subnet_cidr]
  }
  vpc_id = data.aws_vpc.vpc.id
}

# Lookup the existing route table associated with the private subnet
data "aws_route_table" "private_route_table" {
  subnet_id = data.aws_subnet.private_subnet.id
}