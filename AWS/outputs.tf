#Root Outputs

#-----------storge output-------------
output "bucketname" {
  value = "${module.storage.bucketname}"
}

#---------networking outputs-----------
output "subnets ids" {
  value = "${join(", ",module.networking.subnets)}"

  #the join function gets rid of the typical list formatting 
}

output "subnets_ips" {
  value = "${join(", ",module.networking.subnets_ips)}"

  #the join function gets rid of the typical list formatting 
}

output "subnets_availability_zone" {
  value = "${join(", ",module.networking.subnets_availability_zone)}"

  #the join function gets rid of the typical list formatting 
}

output "sg id" {
  value = "${module.networking.sg}"
}

output "routetable id" {
  value = "${module.networking.routetable}"
}

output "igw id" {
  value = "${module.networking.igw}"
}

output "vpc id" {
  value = "${module.networking.vpc}"
}

##-----------compute outputs-----------

output "instances id" {
  value = "${join(", ",module.compute.instances)}"
}

output "public instances ips" {
  value = "${join(", ",module.compute.instances_ips)}"
}
