variable "region" {
  default = "eu-west-2"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "subnet_cidr" {
  type    = "list"
  default = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
}

#variable "azs" {
#  type = "list"
#  default = ["eu-west-2a","eu-west-2b","eu-west-2c"]
#}

data "aws_availability_zones" "azs" {}

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "eu-west-2"
}
variable "AMIS" {
  type = "map"
  default = {
    eu-west-2 = "ami-0d7820945420458e7"
  }
}
