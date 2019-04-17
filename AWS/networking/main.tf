# Main Networking
data "aws_availability_zones" "available" {}

# Creating VPC
resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    Name = "main"
  }
}

# Creating IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "main"
  }
}

# Creating Route Table
resource "aws_route_table" "route_table" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "main"
  }
}

#Creating 2 subnets
resource "aws_subnet" "subnet" {
  count                   = 2
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.public_cidrs[count.index]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name = "main_${count.index + 1}"
  }
}

resource "aws_route_table_association" "route_table_assoc" {
  count          = "${aws_subnet.subnet.count}"
  subnet_id      = "${aws_subnet.subnet.*.id[count.index]}"
  route_table_id = "${aws_route_table.route_table.id}"
}

resource "aws_security_group" "security_group" {
  name        = "security_group"
  description = "Used for access to the public instances"
  vpc_id      = "${aws_vpc.main.id}"

  #SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.accessip}"]
  }

  #HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.accessip}"]
  }

  #HTTP
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["${var.accessip}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.accessip}"]
  }

  tags = {
    Name = "Main"
  }
}
