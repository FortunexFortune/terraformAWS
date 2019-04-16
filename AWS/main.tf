#Root Main

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

module "networking" {
    source = "./networking"
    vpc_cidr = "${var.vpc_cidr}"
    public_cidrs = "${var.subnet_cidrs}"
    accessip = "${var.accessip}"
}

module "compute" {
  source = "./compute"
  instance_count = "${var.instance_count}"
  instance_type = "${var.instance_type}"
  security_group = "${module.networking.sg}" 
  subnets = "${module.networking.subnets}"
  key_name = "${var.key_name}"
  public_key_path = "${var.public_key_path}"
}
