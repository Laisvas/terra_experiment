relative_public_key_path  = "~/.ssh/id_rsa.pub"
#shared_credentials_file = "/Users/.../tmp/credentials"
relative_credentials      = "~/.aws/credentials"
region                    = "us-west-2"
use_module_for_ami        = true
key_name                  = "deployer"

# the next 4 values are used if  "use_module_for_ami = true"
distribution              = "xenial"
architecture              = "amd64"
virttype                  = "hvm"
storagetype               = "ebs-ssd" #"storage type for EBS volumes. Choose 'ebs', 'ebs-ssd', or 'ebs-io1'"

# DO NOT CHANGE THE VALUES BELLOW
system_user               = "ubuntu" # For Ubuntu hosts
timeout                   = "3min"
os_type                   = "ubuntu"

variable "environment" {
  description = "Configure these environments"
  type = "list"
  default = ["production", "development"]
}
