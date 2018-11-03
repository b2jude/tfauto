

# The user data is backed inside the blue and green images. No nned to add user data here
resource "aws_launch_configuration" "asg_lc" {
  name = "${lookup(var.stack_labels, "appname")}.v.{lookup(var.stack_labels, "release")}_asg_lc"
  image_id = "${var.ami_id}"
  instance_type = "${var.instancetype}"
  security_groups = ["${var.instance_securitygroup}"]
  iam_instance_profile = "${var.instanceprofile}"
  user_data ="${var.userdata}"
  lifecycle {
     create_before_destroy = true
   }

  }

  resource "aws_elb" "asg-elb" {
    name = "${lookup(var.stack_labels, "appname")}.v.${lookup(var.stack_labels, "release")}_elb"
    #subnets = ["${var.asg_vpc_zone_subnets}"]
     #subnets = ["${split(",", var.asg_vpc_zone_subnets)}"]
     vpc_zone_identifier = ["${var.asg_subnets}"]
     security_groups = ["${var.instance_securitygroup}"]
     internal = false
    listener {
      instance_port = "${var.instanceport}"
      instance_protocol = "${var.instanceprotocol}"
      lb_port = "${var.lbport}"
      lb_protocol = "${var.lbprotocol}"
    }

    health_check {
      healthy_threshold = "${var.healthythreshold}"
      unhealthy_threshold = "${var.unhealthythreshold}"
      timeout = "${var.timeout}"
      target = "HTTP:80/index.html"
      interval = "${interval}"
    }

    cross_zone_load_balancing = true
    idle_timeout = 400
    connection_draining = true
    connection_draining_timeout = 400

    tags = [
        {
          key = "Name"
          value = "${lookup(var.stack_labels, "appname")}.v.${lookup(var.stack_labels, "release")"
          propagate_at_lauch = true
        }
    ]
  }


  resource "aws_autoscaling_group" "web_appasg" {
    depends_on = ["aws_launch_configuration.asg_lc"]
    name = "${lookup(var.stack_labels, "appname")}.v.${lookup(var.stack_labels, "release")_asg"
    #availability_zones = ["${split(",", var.asg_availability_zones)}"]
    #vpc_zone_identifier = ["${split(",", var.asg_vpc_zone_subnets)}"]
    vpc_zone_identifier = ["${var.asg_subnets}"]
    max_size = "${var.maxsize}"
    min_size = "${var.minsize}"
    desired_capacity = "${var.desirecapacity}"
    force_delete = true
    health_check_grace_period = 500
    health_check_type = "ELB"
    force_delete = true
    load_balancers = ["${aws_elb.asg-elb.name}"]
    launch_configuration = "${aws_launch_configuration.asg_lc.name}"
    enabled_metrics = ["GroupMinSize","GroupMaxSize","GroupInServiceInstances","GroupPendingInstances","GroupTerminatingInstances","GroupStandbyInstances","GroupTotalInstances","GroupDesiredCapacity"]
    tags = [
        {
          key = "Name"
          value = "${lookup(var.stack_labels, "appname")}.v.${lookup(var.stack_labels, "release")"
          propagate_at_lauch = true
        }
    ]
}
