variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "The name to tag the EC2 instance"
  type        = string
}
