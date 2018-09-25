#variable "aws_access_key" {}
#variable "aws_secret_key" {}

#variable "key_name" {}
#variable "public_key_path" {}
variable "myami" {
  default = "ami-04681a1dbd79675a5"
}

#variable "userdata" {}


variable "env_alias" {}

variable "asg_availability_zones" {
    description = "A comma seperated list string of AZs the ASG will be associated with"
     default = "us-east-1a,us-east-1c,us-east-1d"
}

variable "asg_vpc_zone_subnets" {
    description = "A comma seperated list string of VPC subnets to associate with ASG, should correspond with var.availability_zones zones"
    default = "subnet-36e6807c,subnet-53bf6334,subnet-2918c407"
}
