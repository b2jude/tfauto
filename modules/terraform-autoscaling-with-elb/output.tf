output "elb_name" {
  value = ["${aws_elb.asgelb.name}"]
}

output "asg_name" {
    value = "${aws_autoscaling_group.web_appasg.name}"
}

output "elb_dnsname" {
    value = "${aws_elb.asgelb.dns_name}"
}

output "elb_launch_config_name" {
    value = "${aws_launch_configuration.asg_lc.name}"
}
