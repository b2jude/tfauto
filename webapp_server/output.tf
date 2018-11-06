output "albdns_name"  {
  value = "${module.webappasg.alb_dnsname}"
}

output "albname" {
 value = "${module.webappasg.alb_name}"
}

output "asgname" {
 value = "${module.webappasg.asg_name}"
}


output "alblaunch_config_name" {
    value = "${module.webappasg.alb_launch_config_name}"
}

output "alb_targetgroup_arn" {
    value = "${module.webappasg.albtargetgroup_arn}"
}

output "alb_targetgroup_arn" {
    value = "${{module.webappasg.albtargetgroup_arn}"
}
