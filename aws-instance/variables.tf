variable "region" {
  default = "eu-west-1"
}

variable "amis" {
  type = map(string)
  default = {
    "eu-west-1" = "ami-06ce3edf0cff21f07"
    "us-east-2" = "ami-0f7919c33c90f5b58"
  }
}