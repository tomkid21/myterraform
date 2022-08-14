
provider "aws" {}

resource "aws_instance" "ec2_example" {
    ami = "ami-090fa75af13c156b4"
    instance_type = "t2.micro"
    tags = {
      Name = "EC2 Instance with remote state"
    }
}

