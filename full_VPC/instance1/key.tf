resource "aws_key_pair" "ssingh" {
  key_name = "ssingh"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
