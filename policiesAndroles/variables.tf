
variable "appname" {}
variable "release" {}

variable "region" {

  }

locals = {

stack_labels = {
    "appname" = "${var.appname}"
    "release" = "${var.release}"
   }
}
