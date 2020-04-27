provider "aws" {
  profile    = "default"
  region     = var.region
}

# New resource for the S3 bucket our application will use.
resource "aws_s3_bucket" "example" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
  bucket = "rm-terraform-intro-to-iac-example-bucket"
  acl    = "private"
}

resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
  # Tells Terraform that this EC2 instance must be created only after the
  # S3 bucket has been created.
  depends_on = [aws_s3_bucket.example]
}

resource "aws_eip" "ip" {
  vpc = true
  instance = aws_instance.example.id
}

output "ip" {
  value = aws_eip.ip.public_ip
}