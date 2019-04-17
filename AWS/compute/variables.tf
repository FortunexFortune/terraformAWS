#Compute Variables
variable "instance_count" {}

variable "instance_type" {}
variable "security_group" {}

variable "subnets" {
  type = "list"
}

variable "key_name" {}
variable "public_key_path" {}
