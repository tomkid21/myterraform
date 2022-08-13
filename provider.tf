
provider "aws" {
 profile  = "Production1"
}

resource "aws_dynamodb_table" "state_locking" {
  hash_key = "LockID"
  name     = "terraform-lock"
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-090fa75af13c156b4"
    instance_type = "t2.micro"
    tags = {
      Name = "EC2 Instance with remote state"
    }
}