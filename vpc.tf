module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source              = "./modules/security_group"
  vpc_id              = "${module.vpc.vpc_id}"
  security_group_name = "${var.security_group_name}"
  source_cidr_block   = "${var.my_cidr}"
}
