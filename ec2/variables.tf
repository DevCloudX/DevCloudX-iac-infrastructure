variable "aws_region" {
  description = "The AWS region where EC2 instance will be created"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to launch the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance to launch"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}
