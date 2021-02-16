resource "aws_route_table" "exam-route" {
  vpc_id = aws_vpc.exam-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.exam-igw.id
  }

  tags = {
    Name = "exam-route"
  }
}


resource "aws_route_table_association" "route1" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.exam-route.id
}

resource "aws_route_table_association" "route2" {
  subnet_id      = aws_subnet.subnet-2.id
  route_table_id = aws_route_table.exam-route.id
}

resource "aws_route_table_association" "route3" {
  subnet_id      = aws_subnet.subnet-3.id
  route_table_id = aws_route_table.exam-route.id
}