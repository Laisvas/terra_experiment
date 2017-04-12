module "s3" {
  source      = "./modules/s3"
  bucket_name = "${var.bucket_name}"
  policy      = "${data.template_file.s3_permissions.rendered}"
}

resource "aws_vpc_endpoint" "private-s3" {
  vpc_id          = "${module.vpc.vpc_id}"
  service_name    = "com.amazonaws.${var.region}.s3"
  route_table_ids = ["${module.vpc.route_table_ids}"]
}

data "template_file" "s3_permissions" {
  template = "${file("templates/s3_permissions.tpl")}"

  vars {
    vpce     = "${aws_vpc_endpoint.private-s3.id}"
    user_arn = "${var.user_arn}"
  }
}
