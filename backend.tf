terraform {
  backend "s3" {
    bucket = "terraformstates31997"
    key    = "state1"
    region = "us-east-1"
    profile= "Production1"
    dynamodb_table = "terraform-lock"
  }
}