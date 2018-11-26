provider "aws" {
  region = "${var.region}"
  profile = "admin"

}
provider "aws" {
  region = "${var.region}"
  profile = "dev"

}
