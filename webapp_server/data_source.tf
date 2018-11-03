data "aws_vpc" "default" {
  default = true
}

data "aws_security_group" "webapp-sg" {
  name = "webapp_sg"
  vpc_id = "${data.aws_vpc.default.id}"
}

data "aws_iam_instance_profile" "ec2_profile" {
  name = "${lookup(local.stack_labels,"appname" )}_${lookup(local.stack_labels,"release")}_asg_profile"
}

data "aws_subnet" "public_subnet_az_a" {
 tags =  {  Name = "${lookup(local.stack_labels,"appname" )}_${lookup(local.stack_labels,"region")}_a_public_subnet" }
      }

data "aws_subnet" "public_subnet_az_b" {
 tags =  {  Name = "${lookup(local.stack_labels,"appname" )}_${lookup(local.stack_labels,"region")}_b_public_subnet" }
  }


data "aws_subnet" "public_subnet_az_c" {
   tags =  {  Name = "${lookup(local.stack_labels,"appname" )}_${lookup(local.stack_labels,"region")}_c_public_subnet" }
}

data "aws_ami" "ec2-linux" {
  most_recent = true
  filter {
    name = "name"
    values = ["amzn-ami-*-x86_64-gp2"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name = "owner-alias"
    values = ["amazon"]
  }
}

/*
data "aws_vpc" "webappvpc" {
  tags = {
    Name = "${lookup(local.webapp_stacklabels, "appname").v.${lookup(local.webapp_stacklabels, "release")}}"

      }
}
*/
