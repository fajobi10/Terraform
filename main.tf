
locals {
  vpc_id = aws_vpc.myvpc.id
  az = data.aws_availability_zones.available.names[0]
  az1 = data.aws_availability_zones.available.names[1]
}

#date source to pull down availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Create a VPC
resource "aws_vpc" "myvpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.vpc_tag
  }
}

resource "aws_instance" "web" {
  ami               = "ami-04a81a99f5ec58529"
  instance_type     = var.instance_type
  subnet_id         = aws_subnet.public_sub.id
  availability_zone = var.availability_zone_pub

}


resource "aws_subnet" "private_sub" {
  vpc_id            = local.vpc_id
  cidr_block        = var.private_sub_cidr
  availability_zone = local.az

  tags = {
    Name = "private_sub"
  }
}
resource "aws_subnet" "private_sub_2" {
  vpc_id            = local.vpc_id
  cidr_block        = "10.0.3.0/24"
  availability_zone = local.az1

  tags = {
    Name = "private_sub_2"
  }
}

resource "aws_subnet" "public_sub" {
  vpc_id                  = local.vpc_id
  cidr_block              = var.public_sub_cidr
  availability_zone       = local.az1
  map_public_ip_on_launch = true
  tags = {
    Name = "public_sub"
  }
}

resource "aws_subnet" "public_sub_2" {
  vpc_id                  = local.vpc_id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = local.az
  map_public_ip_on_launch = true
  tags = {
    Name = "public_sub_2"
  }
}

