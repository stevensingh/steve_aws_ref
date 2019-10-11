

provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "prime" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags {
    Name = "prime"
    Location = "London"
  }
}

resource "aws_subnet" "subnets" {
  count = "${length(data.aws_availability_zones.azs.names)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  cidr_block = "${element(var.subnet_cidr,count.index)}"
  vpc_id = "${aws_vpc.prime.id}"

  tags {
     Name = "subnet-${count.index+1}"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all traffic"
  vpc_id      = "${aws_vpc.prime.id}"

  ingress {
    from_port   = 0
    to_port     = 0 
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
