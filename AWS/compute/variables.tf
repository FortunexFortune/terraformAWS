#Compute Variables
variable "instance_count" {}
variable "instance_type" {}
variable "security_group" {}
variable "subnets" {    
    type = "list"
}