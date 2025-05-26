terraform {
  backend "s3" {
    bucket = "devcloudx-tf-aws-s3-bucket"
    key    = "aws-ec2/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
