

resource "aws_route53_record" "webapp_live_cname_record" {
         zone_id = "Z10TFNYAKKKBN"
         name    = "${lookup(local.webapp_stacklabels, "appname")}${lookup(local.webapp_stacklabels,"region")}.bmonoue.net"
         type = "${var.type}"
         ttl = "${var.ttl}"
         records =  ["${var.live_url}"]
 }
