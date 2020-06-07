resource "aws_vpc" "Assignment_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "dedicated"

  tags = {
    Name = "BPDTS_vpc"
  }
}