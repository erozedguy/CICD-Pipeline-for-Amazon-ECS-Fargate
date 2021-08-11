resource "aws_vpc" "ecs-vpc" {
  cidr_block = "${var.cidr}"

  tags = {
    Name = "ecs-vpc"
  }
}

# PUBLIC SUBNETS
resource "aws_subnet" "pub-subnets" {
  count                   = length(var.azs)
  vpc_id                  = "${aws_vpc.ecs-vpc.id}"
  availability_zone       = "${var.azs[count.index]}"
  cidr_block              = "${var.subnets-ip[count.index]}"
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-subnets"
  }
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "i-gateway" {
  vpc_id = "${aws_vpc.ecs-vpc.id}"

  tags = {
    Name = "ecs-igtw"
  }
}