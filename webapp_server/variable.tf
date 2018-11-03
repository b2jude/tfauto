#variable "webapp_vpcid" {}

variable "webapp_appname" {}
#variable "webapp_ami_id" {}
variable "webapp_instancetype" {}

#variable "webapp_instanceprofile" {}

#variable "webapp_userdata" {}
#variable "webapp_instance_securitygroup" {}
#variable "webapp_asg_subnets" {}
variable "webapp_instanceport" {}
variable "webapp_instanceprotocol" {}

variable "webapp_lbport" {}
variable "webapp_lbprotocol" {}
variable "webapp_healthythreshold" {}
variable "webapp_unhealthythreshold" {}
variable "webapp_max_size" {}
variable "webapp_min_size" {}
variable "webapp_desirecapacity" {}
variable "webapp_timeout" {}
variable "webapp_interval" {}


variable "release" {}
variable "region" {}

locals {
  webapp_stacklabels = {
     "appname" = "${var.webapp_appname}"
      "release" = "${var.release}"
      "region" =  "${var.region}"
  }
}
