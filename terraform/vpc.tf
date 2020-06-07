resource "aws_vpc" "Assignment_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "dedicated"

  tags = {
    Name = "BPDTS_vpc"
  }
}