variable "policy" {}
variable "bucket_name" {}

resource "aws_s3_bucket" "terraform-stuff" {
  provider = "aws"
  bucket   = "${var.bucket_name}"
  policy   = "${var.policy}"
}

resource "aws_s3_bucket_object" "object" {
  depends_on = ["aws_s3_bucket.terraform-stuff"]
  bucket     = "terraform-stuff"
  key        = "stuff.zip"
  source     = "stuff/stuff.zip"
}
