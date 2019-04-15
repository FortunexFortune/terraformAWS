# Outputs Networking

output "subnets" {
    value = "${aws_subnet.subnet.*.id}"
}

output "sg" {
    value = "${aws_security_group.security_group.id}"
}