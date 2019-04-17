# Outputs Networking

output "subnets" {
  value = "${aws_subnet.subnet.*.id}"
}

output "subnets_ips" {
  value = "${aws_subnet.subnet.*.cidr_block}"
}

output "subnets_availability_zone" {
  value = "${aws_subnet.subnet.*.availability_zone}"
}

output "sg" {
  value = "${aws_security_group.security_group.id}"
}

output "routetable" {
  value = "${aws_route_table.route_table.id}"
}

output "igw" {
  value = "${aws_internet_gateway.igw.id}"
}

output "vpc" {
  value = "${aws_vpc.main.id}"
}
