relative_public_key_path = "~/.ssh/id_rsa.pub"

relative_credentials = "~/.aws/credentials"

key_name = "deployer"

region = "us-west-2"

user_arn = "arn:aws:iam::xxxxx:user/yyyy"

instance_type = "t2.micro"

bucket_name = "terraform-stuff"

# your network to allow ssh etc. access:
my_cidr = "127.0.0.1/32"

security_group_name = "main"

#if true, the comunity ami module will be used to get the ami
use_module_for_ami = true

# the next 4 values are used if  "use_module_for_ami == true"
distribution = "xenial"

architecture = "amd64"

virttype = "hvm"

storagetype = "ebs-ssd" #"storage type for EBS volumes. Choose 'ebs', 'ebs-ssd', or 'ebs-io1'"

###
system_user = "ubuntu" # For Ubuntu hosts

os_type = "ubuntu"
