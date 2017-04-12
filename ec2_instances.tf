module "ec2" {
  source                 = "./modules/ec2"
  subnet_id              = "${module.vpc.aws_subnet.main.id}"
  vpc_security_group_ids = "${module.security_group.vpc_security_group_ids}"
  depends_on             = ["module.vpc", "module.security_group"]
  ami                    = "${var.use_module_for_ami == true ? "${module.ami.ami_id}" : "${lookup(var.amis_ubuntu, var.region)}"}"
  user_data              = "${data.template_file.userdata.rendered}"                                                               #"${data.template_cloudinit_config.config.rendered}"#"${file("user_data.txt")}"
  key_name               = "${var.key_name}"
  instance_type          = "${var.instance_type}"
}

# Template for the cloud-init's cloud-config:
data "template_file" "userdata" {
  template = "${file("templates/user_data.tpl")}"
}

resource "aws_eip" "default" {
  instance = "${module.ec2.aws_instance_id}"
  vpc      = true
}
