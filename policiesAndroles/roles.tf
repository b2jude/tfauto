resource "aws_iam_role" "asg_ec2_role" {
    provider = "aws.dev_account"
    name = "${var.appname}_asg_ec2_role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
  {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
  },
      "Effect": "Allow",
      "Sid": ""
      }
    ]
}
EOF
}


resource "aws_iam_role_policy" "asg_policy" {
    provider = "aws.dev_account"
    name = "${var.appname}_asg_policy"
    role = "${aws_iam_role.asg_ec2_role.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "autoscaling:*",
      "Resource": "*"
    },
    {
        "Effect": "Allow",
        "Action": "cloudwatch:PutMetricAlarm",
        "Resource": "*"
    }
  ]
}
EOF
}


resource "aws_iam_instance_profile" "asg_profile" {
    provider = "aws.dev_account"
    name = "${var.appname}_asg_profile"
    role = "${aws_iam_role.asg_ec2_role.name}"
}
