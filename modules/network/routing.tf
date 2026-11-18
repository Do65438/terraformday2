resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.public_my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.public_my_vpc.id
 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
}
}

resource "aws_route_table_association" "public_route_table_association" {
  count = length(var.public_subnet_cidr_blocks)
  subnet_id = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_route_table_association" {
  count = length(var.private_subnet_cidr_blocks)
  subnet_id = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private_route_table.id
}