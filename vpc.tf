# VPC
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/18"

  tags = {
    Name = "Main VPC"
  }
}
#Creates Public Subnet 
resource "aws_subnet" "Public01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Public01"
  map_public_ip_on_launch = true
  }
}
#Creates Public Subnet 2
resource "aws_subnet" "Public02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Public02"
  map_public_ip_on_launch = true
  }
}
#Creates Private Subnet
resource "aws_subnet" "Private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Private"
  }
}
#Creates Internal Subnet 1