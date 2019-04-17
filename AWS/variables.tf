#Root variables

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "bucketname" {}

variable "subnet_cidrs" {
  type = "list"
}

variable "accessip" {}
variable "region" {}
variable "vpc_cidr" {}

variable "instance_count" {}
variable "instance_type" {}
variable "key_name" {}
variable "public_key_path" {}

/*
region = "us-west-2"
bucketname = "fortune-osadolor-main"
vpc_cidr = "10.0.0.0/16"
subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
accessip = "0.0.0.0/0"
instance_count = "2"
instance_type = "t2.micro"
key_name = "tf_auth"
public_key_path = "/home/fortune/.ssh/id_rsa.pub"

*/

