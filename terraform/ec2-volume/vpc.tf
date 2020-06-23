resource "aws_vpc" "local" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "standard"
  tags = {
    Name = "local"
  }
}