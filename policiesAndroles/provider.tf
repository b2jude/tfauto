/*
provider "aws" {
  region = "${var.region}"
  profile = "admin"
  alias = "adminaccount"
}
*/

provider "aws" {
  region = "${var.region}"
  profile = "devaccount"
  alias = "dev.account"
}
