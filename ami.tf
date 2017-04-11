module "ami" {
  source       = "github.com/terraform-community-modules/tf_aws_ubuntu_ami"
  region       = "${var.region}"
  distribution = "${var.distribution}"
  architecture = "${var.architecture}"
  virttype     = "${var.virttype}"
  storagetype  = "${var.storagetype}"
}
