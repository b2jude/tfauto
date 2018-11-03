output "elb_dns_name"  {
  value = "${module.webappasg.elb_dnsname}"
}

output "elb_name" {
 value = "${module.webappasg.elb_name}"
}

output "asg_name" {
 value = "${module.webappasg.asg_name}"
}
