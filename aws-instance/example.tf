provider "aws" {
  profile    = "default"
  region     = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-06ce3edf0cff21f07"
  instance_type = "t2.micro"
}
