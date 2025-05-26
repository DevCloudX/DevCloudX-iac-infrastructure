terraform {
  backend "s3" {
    bucket = "devcloudx-tf-aws-s3-bucket"
    key    = "devcloudx-tf-aws-s3-bucket_DEV/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
