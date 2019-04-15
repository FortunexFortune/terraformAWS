#Root variables

variable  "aws_access_key" {
    # default = "AKIAUBR3MSP4AVWUTOGY"
    }

variable  "aws_secret_key" {
    # default = "EjqC3HKL7LakJ1v8z9hdjjCHCNFSPC+79NeK0DNA"
}

variable "subnet_cidrs" {
    type = "list"
}

variable "accessip" {}
variable "region" {}
variable "vpc_cidr" {}


variable "instance_count" {}
variable "instance_type" {}
