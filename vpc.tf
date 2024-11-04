# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "${var.env}-nat-eip"
  }
}

# Create the NAT Gateway in the target public subnet
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = data.aws_subnet.public_subnet.id

  tags = {
    Name = "${var.env}-nat-gateway"
  }
}

# Add a route in the target private route table to route traffic to the internet via the NAT Gateway
resource "aws_route" "private_to_internet" {
  route_table_id         = data.aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}