resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_route_table_association" "association-subnet" {
  subnet_id      = "${aws_subnet.main.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"
}

resource "aws_vpc" "main" {
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  cidr_block           = "10.0.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.0.0/24"
}

output "subnet_id" {
  value = "${aws_subnet.main.id }"
}

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "aws_vpc.main.id" {
  value = "${aws_vpc.main.id}" # the point ?
}

output "aws_subnet.main.id" {
  value = "${aws_subnet.main.id}"
}

output "route_table_ids" {
  value = "${aws_route_table.r.id}"
}
