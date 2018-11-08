
resource "aws_route53_record" "webapp_simple_cname_record" {
         zone_id = "Z10TFNYAKKKBN"
         name    = "${lookup(local.stack_labels, "appname")}${lookup(local.stack_labels,"stack_version")}-${lookup(local.stack_labels,"region")}.bmonoue.net"
         type = "${var.type}"
         ttl = "${var.ttl}"
         records =  ["${module.webappasg.alb_dnsname}"]
 }
