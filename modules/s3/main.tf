variable "policy" {}

resource "aws_s3_bucket" "terraform-stuff" {
  provider = "aws"
  bucket   = "terraform-stuff"
  policy   = "${var.policy}"
}

resource "aws_s3_bucket_object" "object" {
  depends_on = ["aws_s3_bucket.terraform-stuff"]
  bucket     = "terraform-stuff"
  key        = "stuff.zip"
  source     = "stuff/stuff.zip"
}
