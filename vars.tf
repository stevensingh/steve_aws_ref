variable "AWS_REGION" {
  default = "eu-west-2"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "ssingh"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "ssingh.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    eu-west-2 = "ami-0cbf340cf716768e5"
  }
}
