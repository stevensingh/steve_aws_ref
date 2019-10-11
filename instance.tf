resource "aws_instance" "example" {
  ami                         = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type               = "t2.micro"
  key_name                    = "ssingh"
  associate_public_ip_address = true
  security_groups = [
    "${aws_security_group.allow_all.id}"
  ]
  subnet_id                   = "subnet-06b46656bc73fb1e5"
}

output "ip" {
  value = "${aws_instance.example.public_ip}"
}
