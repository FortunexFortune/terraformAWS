#Compute Outputs

output "instances" {
  value = "${aws_instance.web.*.id}"
}

output "instances_ips" {
  value = "${aws_instance.web.*.public_ip}"
}
