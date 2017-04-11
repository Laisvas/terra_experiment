# Template for the cloud-init's cloud-config:
data "template_file" "userdata" {
  template = "${file("user_data.tpl")}"
}
