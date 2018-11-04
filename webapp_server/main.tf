

provider "aws" {
  region = "${var.region}"
  profile = "developer"
#  alias   = "dev_account"
}

module "webappasg" {

 source = "../modules/terraform-autoscaling-with-elb"
 stack_labels = "${local.webapp_stacklabels}"
 ami_id = "${data.aws_ami.ec2-linux.id}"
 instance_securitygroup =  ["${data.aws_security_group.webapp-sg.id}"]
  instanceprofile = "${data.aws_iam_instance_profile.ec2_profile.name}"
  userdata = "${file("install_webapp.sh")}"
  asg_subnets = ""${data.aws_subnet.public_subnet_az_a.id}","${data.aws_subnet.public_subnet_az_b.id}","${data.aws_subnet.public_subnet_az_c.id}"" 
  instanceport = "${var.webapp_instanceport}"
  instanceprotocol = "${var.webapp_instanceprotocol}"
  lbport = "${var.webapp_lbport}"
  lbprotocol = "${var.webapp_lbprotocol}"
  healthythreshold = "${var.webapp_healthythreshold}"
  unhealthythreshold = "${var.webapp_unhealthythreshold}"
  timeout = "${var.webapp_timeout}"
  maxsize = "${var.webapp_max_size}"
  minsize = "${var.webapp_min_size}"
  desirecapacity = "${var.webapp_desirecapacity}"
  instancetype = "${var.webapp_instancetype}"
  interval = "${var.webapp_interval}"
}
