#Compute Main

data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*-x86_64-gp2"]
  }
}

resource "aws_instance" "web" {
  count         = "${var.instance_count}"
  ami           = "${data.aws_ami.server_ami.id}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${var.security_group}"]
  subnet_id              = "${element(var.subnets, count.index)}"

  tags = {
    Name = "Main-${count.index + 1}"
  }

}