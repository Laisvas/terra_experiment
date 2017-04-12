variable "relative_public_key_path" {}
variable "relative_credentials" {}
variable "region" {}
variable "os_type" {}
variable "distribution" {}
variable "storagetype" {}
variable "use_module_for_ami" {}
variable "key_name" {}
variable "instance_type" {}
variable "system_user" {}
variable "bucket_name" {}

variable "user_data" {
  default = ""
}

variable "security_group_name" {}
variable "user_arn" {}
variable "my_cidr" {}
variable "architecture" {}
variable "virttype" {}

variable "vpc_security_group_ids" {
  default = []
}

# this map is used if use_module_for_ami == false :
variable "amis_ubuntu" {
  type = "map"

  default = {
    ap-northeast-1 = "ami-76e9b811"
    ap-northeast-2 = "ami-79815217"
    ap-northeast-2 = "ami-2a9c4f44"
    ap-south-1     = "ami-99b9c9f6"
    ap-southeast-1 = "ami-03a31060"
    ap-southeast-2 = "ami-2de5e74e"
    ca-central-1   = "ami-cb5ae7af"
    ca-central-1   = "ami-7e57ea1a"
    cn-north-1     = "ami-a163b4cc"
    eu-central-1   = "ami-a85480c7"
    eu-west-1      = "ami-971238f1"
    eu-west-2      = "ami-ed908589"
    sa-east-1      = "ami-eb791887"
    us-east-1      = "ami-2757f631"
    us-east-2      = "ami-be7753db"
    us-east-2      = "ami-cc7551a9"
    us-gov-west-1  = "ami-35e36654"
    us-west-1      = "ami-44613824"
    us-west-2      = "ami-fa27b39a"
  }
}
