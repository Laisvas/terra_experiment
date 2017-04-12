variable "ami" {}
variable "subnet_id" {}
variable "user_data" {}
variable "depends_on" {}
variable "vpc_security_group_ids" {}
variable "instance_type" {}
variable "key_name" {}

resource "aws_instance" "production" {
  subnet_id              = "${var.subnet_id}"
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  user_data              = "${var.user_data}"
}

output "aws_instance_id" {
  value = "${aws_instance.production.id}"
}
