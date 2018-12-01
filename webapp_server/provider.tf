/*
provider "aws" {
  region = "${var.region}"
  profile = "developer"
  alias   = "dev_account"
}
*/
provider "aws" {
  region = "${var.region}"
  profile = "devaccount"
  alias = "dev.account"
}
