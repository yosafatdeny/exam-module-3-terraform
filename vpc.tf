resource "aws_vpc" "exam-vpc" {
  cidr_block            = "21.0.0.0/16"
  instance_tenancy      = "default"
  enable_dns_support    = true
  enable_dns_hostnames  = true

  tags = {
    Name = "exam-vpc"
  }
}