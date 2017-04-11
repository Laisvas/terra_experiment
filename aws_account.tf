provider "aws" {
  shared_credentials_file = "${pathexpand(var.relative_credentials)}"
  region                  = "${var.region}"
}

resource "aws_key_pair" "deployer" {
  key_name   = "${var.key_name}"
  public_key = "${file(pathexpand(var.relative_public_key_path))}"
}
