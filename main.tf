module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source                 = "./modules/ec2"
  subnet_id              = "${module.vpc.aws_subnet.main.id}"
  vpc_security_group_ids = "${module.security_group.vpc_security_group_ids}"
  depends_on             = ["module.vpc", "module.security_group"]
  ami                    = "${var.use_module_for_ami == true ? "${module.ami.ami_id}" : "${lookup(var.amis_ubuntu, var.region)}"}"
  user_data              = "${data.template_file.userdata.rendered}"                                                               #"${data.template_cloudinit_config.config.rendered}"#"${file("user_data.txt")}"
  key_name               = "${var.key_name}"
}

module "security_group" {
  source              = "./modules/security_group"
  vpc_id              = "${module.vpc.vpc_id}"
  security_group_name = "def"
  source_cidr_block   = "${var.my_cidr}"
}

resource "aws_eip" "default" {
  instance = "${module.ec2.aws_instance_id}"
  vpc      = true
}

# Template for the s3 permissions:
data "template_file" "s3_permissions" {
  template = "${file("s3_permissions.tpl")}"

  vars {
    vpce     = "${aws_vpc_endpoint.private-s3.id}"
    user_arn = "${var.user_arn}"
  }
}

module "s3" {
  source = "./modules/s3"
  policy = "${data.template_file.s3_permissions.rendered}"
}

resource "aws_vpc_endpoint" "private-s3" {
  vpc_id          = "${module.vpc.vpc_id}"
  service_name    = "com.amazonaws.us-west-2.s3"
  route_table_ids = ["${module.vpc.route_table_ids}"]
}

output "subnet_id" {
  value = "${module.vpc.subnet_id}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "aws_subnet.main.id" {
  value = "${module.vpc.aws_subnet.main.id}"
}

output "aws_instance.production.id" {
  value = "${module.ec2.aws_instance_id}"
}

output "public_ip" {
  value = "${aws_eip.default.public_ip}"
}
