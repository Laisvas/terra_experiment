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
