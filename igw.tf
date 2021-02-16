resource "aws_internet_gateway" "exam-igw" {
    vpc_id = aws_vpc.exam-vpc.id


    tags = {
      Name = "exam-igw"
    }
  
}