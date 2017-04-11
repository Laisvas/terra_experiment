#cloud-config

#package_upgrade: true

packages:
- python-pip
- virtualenv
- python-dev
- libssl-dev
- unzip
- libffi-dev

runcmd:
- pip install --upgrade pip
- pip install --upgrade ansible
- pip install --upgrade boto
- wget --no-check-certificate --no-proxy 'http://s3-us-west-2.amazonaws.com/terraform-stuff/stuff.zip' -P /root/
- unzip /root/stuff.zip -d /root/
- sudo ansible-playbook /root/devops-test/main_production.yml

#power_state:
#  mode: reboot
