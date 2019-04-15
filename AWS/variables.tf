#Root variables

variable  "aws_access_key" {
    }

variable  "aws_secret_key" {
}

variable "subnet_cidrs" {
    type = "list"
}

variable "accessip" {}
variable "region" {}
variable "vpc_cidr" {}


variable "instance_count" {}
variable "instance_type" {}
