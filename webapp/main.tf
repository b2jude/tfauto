
module "webappasg" {
 source = "../modules/terraform-autoscaling-with-elb"
 stack_labels = "${local.webapp_stacklabels}"
 ami_id = "${data.aws_ami.ec2-linux.id}"
 instance_securitygroup =  ["${data.aws_security_group.webapp-sg.id}"]
 iam_instance_profile = "${data.aws_iam_instance_profile.ec2_profile.name}"
  user_data = "${file("install_webapp.sh")}"
  asg_subnets = ["${data.aws_subnet.public_subnet_az_a.id}","${data.aws_subnet.public_subnet_az_b.id}","data.aws_subnet.public_subnet_az_c.id"]
  instanceport = "${webapp_instanceport}"
  instanceprotocol = "${webapp_instanceprotocol}"
  lbport = "${webapp_lbport}"
  lbprotocol = "${webapp_lbprotocol}"
  healthythreshold = "${webapp_healthythreshold}"
  unhealthythreshold = "${webapp_unhealthythreshold}"
  timeout = "${webapp_timeout}"
  max_size = "$(webapp_max_size)"
  min_size = "${webapp_min_size}"
  desirecapacity "${webapp_desirecapacity}"
}