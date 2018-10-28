provider "aws" {
  region = ${var.region}
  profile = "developer"
  alias   = "dev_account"
}
