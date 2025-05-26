provider "aws" {
  region = "us-east-1" # Change this to your preferred region
}

resource "aws_s3_bucket" "tf_state" {
  bucket = var.se_bucket_name
  force_destroy = true

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt" {
  bucket = aws_s3_bucket.tf_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket                  = aws_s3_bucket.tf_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


##S3 bucket to be publicly accessible

# provider "aws" {
#   region = "us-east-1" # Change this to your preferred region
# }

# resource "aws_s3_bucket" "tf_state" {
#   bucket         = "devcloudx-tf-aws-s3-bucket-1"  # Must be globally unique
#   force_destroy  = true
#   acl            = "public-read"

#   tags = {
#     Name        = "Terraform State Bucket"
#     Environment = "Dev"
#   }
# }

# resource "aws_s3_bucket_versioning" "versioning" {
#   bucket = aws_s3_bucket.tf_state.id

#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt" {
#   bucket = aws_s3_bucket.tf_state.id

#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }

# # ✅ ALLOW PUBLIC ACCESS (DO NOT block it)
# resource "aws_s3_bucket_public_access_block" "allow_public_access" {
#   bucket                  = aws_s3_bucket.tf_state.id
#   block_public_acls       = false
#   block_public_policy     = false
#   ignore_public_acls      = false
#   restrict_public_buckets = false
# }

# # ✅ PUBLIC POLICY FOR READ ACCESS
# resource "aws_s3_bucket_policy" "public_policy" {
#   bucket = aws_s3_bucket.tf_state.id

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Sid       = "PublicReadGetObject",
#         Effect    = "Allow",
#         Principal = "*",
#         Action    = "s3:GetObject",
#         Resource  = "${aws_s3_bucket.tf_state.arn}/*"
#       }
#     ]
#   })
# }
