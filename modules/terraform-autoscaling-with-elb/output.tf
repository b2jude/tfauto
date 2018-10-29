output "elb_name" {
  value = ["${aws_elb.asg-elb.name}"]
}

output "asg_name" {
    value = "${var.appname}_asg"
}
